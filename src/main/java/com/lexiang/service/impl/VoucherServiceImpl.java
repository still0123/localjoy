package com.lexiang.service.impl;

import cn.hutool.core.lang.UUID;
import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lexiang.dto.Result;
import com.lexiang.entity.SeckillVoucher;
import com.lexiang.entity.Voucher;
import com.lexiang.mapper.VoucherMapper;
import com.lexiang.service.ISeckillVoucherService;
import com.lexiang.service.IVoucherService;
import com.lexiang.utils.RedisData;
import org.springframework.core.io.ClassPathResource;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.script.DefaultRedisScript;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import static com.lexiang.utils.RedisConstants.CACHE_VOUCHER_KEY;
import static com.lexiang.utils.RedisConstants.CACHE_VOUCHER_TTL;
import static com.lexiang.utils.RedisConstants.HOT_VOUCHER_SHOP_KEY;
import static com.lexiang.utils.RedisConstants.LOCK_SHOP_TTL;
import static com.lexiang.utils.RedisConstants.LOCK_VOUCHER_KEY;
import static com.lexiang.utils.RedisConstants.SECKILL_STOCK_KEY;

@Service
public class VoucherServiceImpl extends ServiceImpl<VoucherMapper, Voucher> implements IVoucherService {

    private static final DefaultRedisScript<Long> UNLOCK_SCRIPT = new DefaultRedisScript<>();

    private static final String LOCK_OWNER_PREFIX = UUID.randomUUID().toString(true) + "-";

    static {
        UNLOCK_SCRIPT.setLocation(new ClassPathResource("unlock.lua"));
        UNLOCK_SCRIPT.setResultType(Long.class);
    }

    private static final ExecutorService CACHE_REBUILD_EXECUTOR = Executors.newSingleThreadExecutor();

    @Resource
    private ISeckillVoucherService seckillVoucherService;

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public Result queryVoucherOfShop(Long shopId) {

        if (Boolean.TRUE.equals(stringRedisTemplate.opsForSet().isMember(HOT_VOUCHER_SHOP_KEY, shopId.toString()))) {
            return queryHotVoucherOfShop(shopId);
        }
        return queryNormalVoucherOfShop(shopId);
    }

    @Override
    @Transactional
    public void addSeckillVoucher(Voucher voucher) {

        save(voucher);

        SeckillVoucher seckillVoucher = new SeckillVoucher();
        seckillVoucher.setVoucherId(voucher.getId());
        seckillVoucher.setStock(voucher.getStock());
        seckillVoucher.setBeginTime(voucher.getBeginTime());
        seckillVoucher.setEndTime(voucher.getEndTime());
        seckillVoucherService.save(seckillVoucher);

        stringRedisTemplate.opsForValue().set(SECKILL_STOCK_KEY + voucher.getId(), voucher.getStock().toString());

        stringRedisTemplate.opsForSet().add(HOT_VOUCHER_SHOP_KEY, voucher.getShopId().toString());

        refreshVoucherCache(voucher.getShopId());
    }

    @Override
    public boolean save(Voucher entity) {
        boolean saved = super.save(entity);

        if (saved && entity != null && entity.getShopId() != null) {
            refreshVoucherCache(entity.getShopId());
        }
        return saved;
    }

    private Result queryNormalVoucherOfShop(Long shopId) {
        String key = CACHE_VOUCHER_KEY + shopId;
        String voucherJson = stringRedisTemplate.opsForValue().get(key);

        if (voucherJson != null) {
            return Result.ok(JSONUtil.toList(voucherJson, Voucher.class));
        }

        List<Voucher> vouchers = queryVoucherList(shopId);
        stringRedisTemplate.opsForValue().set(key, JSONUtil.toJsonStr(vouchers), CACHE_VOUCHER_TTL, TimeUnit.MINUTES);
        return Result.ok(vouchers);
    }

    private Result queryHotVoucherOfShop(Long shopId) {
        String key = CACHE_VOUCHER_KEY + shopId;
        String voucherJson = stringRedisTemplate.opsForValue().get(key);

        if (voucherJson == null) {
            List<Voucher> vouchers = queryVoucherList(shopId);
            saveHotVoucher2Redis(shopId, vouchers, CACHE_VOUCHER_TTL);
            return Result.ok(vouchers);
        }

        RedisData redisData = JSONUtil.toBean(voucherJson, RedisData.class);
        List<Voucher> vouchers = JSONUtil.toList(JSONUtil.toJsonStr(redisData.getData()), Voucher.class);

        if (redisData.getExpireTime().isAfter(LocalDateTime.now())) {
            return Result.ok(vouchers);
        }

        String lockKey = LOCK_VOUCHER_KEY + shopId;
        String lockValue = tryLock(lockKey);
        if (lockValue != null) {
            CACHE_REBUILD_EXECUTOR.submit(() -> {
                try {
                    List<Voucher> freshVouchers = queryVoucherList(shopId);
                    saveHotVoucher2Redis(shopId, freshVouchers, CACHE_VOUCHER_TTL);
                } finally {
                    unlock(lockKey, lockValue);
                }
            });
        }

        return Result.ok(vouchers);
    }

    private List<Voucher> queryVoucherList(Long shopId) {
        List<Voucher> vouchers = getBaseMapper().queryVoucherOfShop(shopId);
        return vouchers == null ? Collections.emptyList() : vouchers;
    }

    private void refreshVoucherCache(Long shopId) {
        if (shopId == null) {
            return;
        }

        Boolean hot = stringRedisTemplate.opsForSet().isMember(HOT_VOUCHER_SHOP_KEY, shopId.toString());
        if (Boolean.TRUE.equals(hot)) {
            refreshHotVoucherLogicalExpire(shopId);
            return;
        }

        String key = CACHE_VOUCHER_KEY + shopId;
        stringRedisTemplate.delete(key);
        CACHE_REBUILD_EXECUTOR.submit(() -> {
            try {
                Thread.sleep(500);
                stringRedisTemplate.delete(key);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        });
    }

    private void refreshHotVoucherLogicalExpire(Long shopId) {
        List<Voucher> freshVouchers = queryVoucherList(shopId);
        saveHotVoucher2Redis(shopId, freshVouchers, CACHE_VOUCHER_TTL);
    }

    private void saveHotVoucher2Redis(Long shopId, List<Voucher> vouchers, Long expireMinutes) {
        RedisData redisData = new RedisData();
        redisData.setData(vouchers);
        redisData.setExpireTime(LocalDateTime.now().plusMinutes(expireMinutes));
        stringRedisTemplate.opsForValue().set(CACHE_VOUCHER_KEY + shopId, JSONUtil.toJsonStr(redisData));
    }

    private String tryLock(String key) {
        String lockValue = LOCK_OWNER_PREFIX + Thread.currentThread().getId();
        Boolean success = stringRedisTemplate.opsForValue().setIfAbsent(key, lockValue, LOCK_SHOP_TTL, TimeUnit.SECONDS);
        return Boolean.TRUE.equals(success) ? lockValue : null;
    }

    private void unlock(String key, String lockValue) {
        stringRedisTemplate.execute(UNLOCK_SCRIPT, Collections.singletonList(key), lockValue);
    }
}
