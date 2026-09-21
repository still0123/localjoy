# LocalJoy · 乐享周边

一个面向本地生活场景的 H5 分享项目，由 still0123 维护。后端使用 Spring Boot、MyBatis-Plus、MySQL、Redis 和 RocketMQ，前端使用 Vue 2、Element UI 与 Nginx。

本仓库基于既有学习工程二次开发，保留必要的原作者和第三方归属信息，详见 [来源说明](THIRD_PARTY_NOTICES.md)。

## 功能与实现范围

| 功能 | 当前状态 |
| --- | --- |
| 验证码登录、登录态续期和拦截校验 | 已实现；验证码写入后端日志，未接入短信平台 |
| 店铺分类、名称搜索与详情缓存 | 已实现；空值缓存降低缓存穿透风险 |
| 发布笔记、热门笔记、个人笔记列表 | 已实现基础接口 |
| 点赞 | 基础计数，尚未实现重复点赞限制和取消点赞 |
| 关注、取消关注、共同关注 | 已实现；共同关注通过 Redis Set 交集计算 |
| 福利券秒杀 | Lua 预占库存及资格，数据库条件扣减库存 |
| 支付结果与超时关单 | 有 RocketMQ 实现，默认关闭；未接入真实支付渠道 |
| 关注动态推送、定位距离排序 | 尚未实现 |

项目可启动不代表所有业务已达到生产可用状态。缓存一致性、订单事务与消息可靠性方面的限制见 [实现说明](docs/architecture.md)。

## 项目结构

```text
src/main/java/com/lexiang/   后端控制器、服务、数据访问与消息处理
src/main/resources/         配置、SQL、Mapper XML 与 Lua
src/test/                   可显式启用的秒杀压测
frontend/                   H5 页面、静态资源与 Windows Nginx
scripts/                    本地启停、压测与数据核对工具
jmeter/                     JMeter 测试计划
docs/                       实现和验证说明
```

仓库名称为 `localjoy`，现有 Java 包、构建产物和数据库标识保持为 `lexiang`。

## 本地运行

环境：JDK 17、Maven 3.9、MySQL 8、Redis。前端随仓库提供 Windows Nginx；其他系统可安装 Nginx 并使用 `frontend/conf/nginx.conf`。

1. 克隆仓库并复制配置示例：

   ```powershell
   git clone https://github.com/still0123/localjoy.git
   cd localjoy
   Copy-Item .env.example .env
   ```

2. 编辑 `.env`，设置本机 MySQL 与 Redis 连接参数。该文件已被 Git 忽略。
3. 首次使用时，在 MySQL 中创建 `lexiang` 数据库，并把 `src/main/resources/db/lexiang.sql` 导入这个新数据库。脚本包含重建表语句，已有数据的数据库无需重复导入。
4. 启动 MySQL 与 Redis，双击 `启动乐享周边.cmd`，或执行：

   ```powershell
   powershell -NoProfile -ExecutionPolicy Bypass -File .\scripts\start-local.ps1
   ```

5. 打开 http://127.0.0.1:8080/ 。关闭时双击 `停止乐享周边.cmd`。

前端和后端默认仅监听本机的 8080、8081 端口；上传文件保存到 `frontend/html/lexiang/imgs`。
Windows 脚本在本机 Redis 未启动时会尝试启动 `.env` 中指定的现有 Docker 容器。其他 Redis 部署方式请自行启动服务。

修改源码后，停止服务，再执行 `scripts/start-local.ps1 -Rebuild`。
日志写入 `runtime` 和 `frontend/logs`，不提交到 Git。

## 可选 RocketMQ

先停止默认后端，然后执行：

```powershell
docker compose up -d
. .\scripts\load-env.ps1
mvn spring-boot:run "-Dspring-boot.run.profiles=rocketmq"
```

当前支付接口用于本地模拟支付结果。默认关闭 MQ 时，不会执行支付结果异步落库或自动超时关单。

## 构建与验证

```powershell
mvn -B verify
```

普通构建不执行会创建业务数据的压测。压测须显式启用，具体命令和已验证范围见 [验证说明](docs/testing.md)。
运行记录、会话令牌、压测结果、个人面试笔记和本机配置不会上传；SQL 中的用户账号是演示数据。
