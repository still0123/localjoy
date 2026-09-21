package com.lexiang.service.impl;

import cn.hutool.json.JSONUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.lexiang.dto.Result;
import com.lexiang.entity.Shop;
import com.lexiang.mapper.ShopMapper;
import com.lexiang.service.IShopService;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import static com.lexiang.utils.RedisConstants.CACHE_NULL_TTL;
import static com.lexiang.utils.RedisConstants.CACHE_SHOP_KEY;
import static com.lexiang.utils.RedisConstants.CACHE_SHOP_TTL;

@Service
public class ShopServiceImpl extends ServiceImpl<ShopMapper, Shop> implements IShopService {

    private static final ScheduledExecutorService CACHE_REBUILD_EXECUTOR = Executors.newSingleThreadScheduledExecutor();

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public Result queryById(Long id) {
        String key = CACHE_SHOP_KEY + id;
        String shopJson = stringRedisTemplate.opsForValue().get(key);
        if (shopJson != null) {
            if (shopJson.isEmpty()) {
                return Result.fail("店铺不存在");
            }
            return Result.ok(JSONUtil.toBean(shopJson, Shop.class));
        }

        Shop shop = getById(id);
        // 不存在的店铺使用短 TTL 空值缓存。
        if (shop == null) {
            stringRedisTemplate.opsForValue().set(key, "", CACHE_NULL_TTL, TimeUnit.MINUTES);
            return Result.fail("店铺不存在");
        }

        stringRedisTemplate.opsForValue().set(key, JSONUtil.toJsonStr(shop), CACHE_SHOP_TTL, TimeUnit.MINUTES);
        return Result.ok(shop);
    }

    @Override
    @Transactional
    public Result updateShop(Shop shop) {
        if (shop.getId() == null) {
            return Result.fail("店铺id不能为空");
        }

        updateById(shop);
        String key = CACHE_SHOP_KEY + shop.getId();
        stringRedisTemplate.delete(key);
        // 延迟失效仅降低并发回填旧值的风险，不保证强一致性。
        CACHE_REBUILD_EXECUTOR.schedule(() -> stringRedisTemplate.delete(key), 500, TimeUnit.MILLISECONDS);
        return Result.ok();
    }
}
