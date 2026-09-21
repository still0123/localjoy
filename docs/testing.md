# 验证说明

## 构建

使用 JDK 17 执行 `mvn -B verify`。秒杀压测以 `load.enabled=true` 为显式开关，默认跳过。
当前没有完整的单元测试套件；构建成功仅说明编译和打包通过。

## 基础功能检查

本地已检查：首页、分类、商铺详情、热门笔记、优惠券列表、验证码登录、当前用户、登出、图片上传和静态图片读取。
验证使用临时用户和测试图片，结束后清理。未执行 RocketMQ 完整支付/关单链路或高并发正确性验证。

## 初始化数据

已在 MySQL 8 的独立临时数据库中导入发布用 SQL，确认 11 张表、1005 个虚构演示账号及空订单表均可正常恢复。秒杀券的开始和结束时间没有零日期默认值，新增时须显式提供。验证结束后清理了临时数据库。

## 显式压测

仅在专用测试数据库和 Redis 中运行；这些命令会创建用户、优惠券、订单和会话。

```powershell
. .\scripts\load-env.ps1
mvn test "-Dtest=SeckillLoadTest" "-Dload.enabled=true"
```

参数支持 `load.baseUrl`、`load.redisHost`、`load.redisPort`、`load.redisPassword`、`load.userCount`、`load.concurrency`、`load.stock` 和 `load.voucherId`。
Redis 密码也可以通过 `REDIS_PASSWORD` 环境变量提供。
另有 `scripts/load-test-seckill.ps1` 和 `jmeter/seckill-load-test.jmx`；生成的 token CSV 和结果报告均已加入忽略列表。
