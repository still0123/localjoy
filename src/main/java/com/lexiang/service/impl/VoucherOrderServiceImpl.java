package com.lexiang.service.impl;

import cn.hutool.core.lang.Snowflake;
import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lexiang.dto.Result;
import com.lexiang.dto.UserDTO;
import com.lexiang.entity.SeckillVoucher;
import com.lexiang.entity.VoucherOrder;
import com.lexiang.mapper.VoucherOrderMapper;
import com.lexiang.mq.OrderEventPublisher;
import com.lexiang.service.ISeckillVoucherService;
import com.lexiang.service.IVoucherOrderService;
import com.lexiang.utils.UserHolder;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Collections;
import java.util.concurrent.TimeUnit;

import static com.lexiang.utils.RedisConstants.LOCK_ORDER_KEY;
import static com.lexiang.utils.RedisConstants.ORDER_PAY_MARK_KEY;
import static com.lexiang.utils.RedisConstants.ORDER_PAY_MARK_TTL;
import static com.lexiang.utils.RedisConstants.SECKILL_ORDER_KEY;
import static com.lexiang.utils.RedisConstants.SECKILL_STOCK_KEY;

@Slf4j
@Service
public class VoucherOrderServiceImpl extends ServiceImpl<VoucherOrderMapper, VoucherOrder> implements IVoucherOrderService {

    private static final int ORDER_STATUS_UNPAID = 1;

    private static final int ORDER_STATUS_PAID = 2;

    private static final int ORDER_STATUS_CANCELED = 4;

    private static final int TIMEOUT_RECHECK_DELAY_LEVEL = 3;

    private static final DefaultRedisScript<Long> SECKILL_SCRIPT = new DefaultRedisScript<>();

    private static final DefaultRedisScript<Long> UNLOCK_SCRIPT = new DefaultRedisScript<>();

    private static final String LOCK_OWNER_PREFIX = UUID.randomUUID().toString(true) + "-";

    static {
        SECKILL_SCRIPT.setLocation(new ClassPathResource("seckill.lua"));
        SECKILL_SCRIPT.setResultType(Long.class);
        UNLOCK_SCRIPT.setLocation(new ClassPathResource("unlock.lua"));
        UNLOCK_SCRIPT.setResultType(Long.class);
    }

    @Resource
    private ISeckillVoucherService seckillVoucherService;

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Resource
    private OrderEventPublisher orderEventPublisher;

    private static final Snowflake SNOWFLAKE = IdUtil.getSnowflake(1, 1);

    @Override
    @Transactional
    public Result seckillVoucher(Long voucherId) {

        UserDTO user = UserHolder.getUser();
        if (user == null) {
            return Result.fail("请先登录");
        }

        SeckillVoucher voucher = seckillVoucherService.getById(voucherId);
        if (voucher == null) {
            return Result.fail("优惠券不存在");
        }

        LocalDateTime now = LocalDateTime.now();
        if (now.isBefore(voucher.getBeginTime())) {
            return Result.fail("秒杀尚未开始");
        }
        if (now.isAfter(voucher.getEndTime())) {
            return Result.fail("秒杀已经结束");
        }

        Long userId = user.getId();
        String stockKey = SECKILL_STOCK_KEY + voucherId;

        if (Boolean.FALSE.equals(stringRedisTemplate.hasKey(stockKey))) {
            stringRedisTemplate.opsForValue().set(stockKey, voucher.getStock().toString());
        }

        // 预占库存和购买资格必须在同一次 Lua 调用中完成。
        Long scriptResult = stringRedisTemplate.execute(
                SECKILL_SCRIPT,
                Arrays.asList(stockKey, SECKILL_ORDER_KEY + voucherId),
                userId.toString()
        );
        if (scriptResult == null) {
            return Result.fail("秒杀服务异常");
        }
        if (scriptResult == 1L) {
            return Result.fail("库存不足");
        }
        if (scriptResult == 2L) {
            return Result.fail("每人限购一张");
        }

        Integer count = query()
                .eq("user_id", userId)
                .eq("voucher_id", voucherId)
                .in("status", Arrays.asList(ORDER_STATUS_UNPAID, ORDER_STATUS_PAID, 3, 5))
                .count();
        if (count != null && count > 0) {

            rollbackSeckillReservation(voucherId, userId);
            return Result.fail("每人限购一张");
        }

        // MySQL 的库存条件更新作为防超卖兜底。
        boolean success = seckillVoucherService.update()
                .setSql("stock = stock - 1")
                .eq("voucher_id", voucherId)
                .gt("stock", 0)
                .update();
        if (!success) {

            rollbackSeckillReservation(voucherId, userId);
            return Result.fail("库存不足");
        }

        VoucherOrder order = new VoucherOrder();
        order.setId(SNOWFLAKE.nextId());
        order.setUserId(userId);
        order.setVoucherId(voucherId);
        order.setStatus(ORDER_STATUS_UNPAID);
        order.setPayType(1);
        boolean saved = save(order);
        if (!saved) {

            seckillVoucherService.update()
                    .setSql("stock = stock + 1")
                    .eq("voucher_id", voucherId)
                    .update();
            rollbackSeckillReservation(voucherId, userId);
            return Result.fail("创建订单失败");
        }

        orderEventPublisher.sendOrderTimeoutCheck(order.getId());
        return Result.ok(order.getId());
    }

    @Override
    public Result payOrder(Long orderId, Integer payType) {

        UserDTO currentUser = UserHolder.getUser();
        if (currentUser == null) {
            return Result.fail("请先登录");
        }

        VoucherOrder order = getById(orderId);
        if (order == null) {
            return Result.fail("订单不存在");
        }

        if (!currentUser.getId().equals(order.getUserId())) {
            return Result.fail("无权操作该订单");
        }

        if (!Integer.valueOf(ORDER_STATUS_UNPAID).equals(order.getStatus())) {
            return Result.fail("订单状态不允许支付");
        }

        stringRedisTemplate.opsForValue()
                .set(orderPayMarkKey(orderId), payType.toString(), ORDER_PAY_MARK_TTL, TimeUnit.MINUTES);

        orderEventPublisher.sendPayResult(orderId, payType);
        return Result.ok("支付结果已提交，等待异步处理");
    }

    @Override
    @Transactional
    public void handlePayResult(Long orderId, Integer payType) {
        String lockKey = LOCK_ORDER_KEY + orderId;

        String lockValue = tryLock(lockKey);
        if (lockValue == null) {
            log.warn("订单支付结果处理加锁失败，orderId={}", orderId);
            throw new IllegalStateException("处理支付结果时未获取到订单锁，orderId=" + orderId);
        }

        try {

            VoucherOrder order = getById(orderId);
            if (order == null) {

                stringRedisTemplate.delete(orderPayMarkKey(orderId));
                return;
            }
            if (Integer.valueOf(ORDER_STATUS_PAID).equals(order.getStatus())) {

                stringRedisTemplate.delete(orderPayMarkKey(orderId));
                return;
            }
            if (!Integer.valueOf(ORDER_STATUS_UNPAID).equals(order.getStatus())) {

                log.warn("支付结果到达时订单已非待支付状态，orderId={}, status={}", orderId, order.getStatus());
                stringRedisTemplate.delete(orderPayMarkKey(orderId));
                return;
            }

            order.setStatus(ORDER_STATUS_PAID);
            order.setPayType(payType);
            order.setPayTime(LocalDateTime.now());
            updateById(order);

            stringRedisTemplate.delete(orderPayMarkKey(orderId));
        } finally {

            unlock(lockKey, lockValue);
        }
    }

    @Override
    @Transactional
    public void closeTimeoutOrder(Long orderId) {
        String lockKey = LOCK_ORDER_KEY + orderId;

        String lockValue = tryLock(lockKey);
        if (lockValue == null) {
            log.warn("超时订单关闭加锁失败，orderId={}", orderId);
            throw new IllegalStateException("关闭超时订单时未获取到订单锁，orderId=" + orderId);
        }

        try {

            VoucherOrder order = getById(orderId);
            if (order == null || !Integer.valueOf(ORDER_STATUS_UNPAID).equals(order.getStatus())) {
                return;
            }

            if (Boolean.TRUE.equals(stringRedisTemplate.hasKey(orderPayMarkKey(orderId)))) {
                log.info("订单已提交支付结果，延迟再次检查，orderId={}", orderId);
                orderEventPublisher.sendOrderTimeoutCheck(orderId, TIMEOUT_RECHECK_DELAY_LEVEL);
                return;
            }

            order.setStatus(ORDER_STATUS_CANCELED);
            updateById(order);

            seckillVoucherService.update()
                    .setSql("stock = stock + 1")
                    .eq("voucher_id", order.getVoucherId())
                    .update();

            stringRedisTemplate.opsForValue().increment(SECKILL_STOCK_KEY + order.getVoucherId());
            stringRedisTemplate.opsForSet().remove(SECKILL_ORDER_KEY + order.getVoucherId(), order.getUserId().toString());
        } finally {
            unlock(lockKey, lockValue);
        }
    }

    private void rollbackSeckillReservation(Long voucherId, Long userId) {

        stringRedisTemplate.opsForValue().increment(SECKILL_STOCK_KEY + voucherId);
        stringRedisTemplate.opsForSet().remove(SECKILL_ORDER_KEY + voucherId, userId.toString());
    }

    private String tryLock(String key) {

        // 解锁脚本校验持有者，避免释放其他线程的锁。
        String lockValue = LOCK_OWNER_PREFIX + Thread.currentThread().getId();

        Boolean success = stringRedisTemplate.opsForValue().setIfAbsent(key, lockValue, 10, TimeUnit.SECONDS);
        return Boolean.TRUE.equals(success) ? lockValue : null;
    }

    private void unlock(String key, String lockValue) {

        stringRedisTemplate.execute(UNLOCK_SCRIPT, Collections.singletonList(key), lockValue);
    }

    private String orderPayMarkKey(Long orderId) {

        return ORDER_PAY_MARK_KEY + orderId;
    }
}
