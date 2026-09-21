-- 秒杀资格预检脚本：
-- 1. 判断库存是否充足
-- 2. 判断用户是否已经下单
-- 3. 预扣减 Redis 库存并记录用户下单资格

local stockKey = KEYS[1]
local orderKey = KEYS[2]
local userId = ARGV[1]

local stock = tonumber(redis.call('get', stockKey))
if (not stock) or (stock <= 0) then
    return 1
end

if redis.call('sismember', orderKey, userId) == 1 then
    return 2
end

redis.call('decr', stockKey)
redis.call('sadd', orderKey, userId)
return 0
