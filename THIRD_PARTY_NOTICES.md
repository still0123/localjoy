# 来源与第三方组件

本项目以本地的黑马点评学习工程为基础进行整理和二次开发，并非全部从零原创。
本仓库维护者为 still0123；当前维护内容包括产品更名、前后端整合、启动脚本、运行验证、配置外置和文档整理。
本地原工程没有附带可确认覆盖全部业务源码的统一开源许可证，因此本仓库不额外声明业务源码为 MIT 或 Apache 授权。

## 原工程归属

原始 `BlogCommentsController.java` 中的 `@author 虎哥`、`@since 2021-12-22` 记录予以保留。
示例店铺、探店内容和图片继承自原工程，用于本地学习演示，不作为维护者原创素材声明。
初始化用户数据已改为确定性的虚构示例，未发布本机现有用户、订单或会话数据。

## 随仓库分发的组件

- Vue.js 2.5.16：Evan You，MIT；保留 `frontend/html/lexiang/js/vue.js` 中的原始声明。
- Axios 0.18.0：Matt Zabriskie；保留 `frontend/html/lexiang/js/axios.min.js` 中的原始声明。
- Element UI：保留原工程随附库文件，不将其视为本项目原创源码。
- Nginx 1.18.0 Windows 分发包：Igor Sysoev / Nginx, Inc.；许可文本见 `frontend/docs/LICENSE`。
- Nginx 随附 OpenSSL、PCRE 和 zlib 的许可分别见 `frontend/docs/OpenSSL.LICENSE`、`frontend/docs/PCRE.LICENCE`、`frontend/docs/zlib.LICENSE`。

后端依赖通过 Maven 获取，依赖坐标及版本见 `pom.xml`，其授权归各原作者所有。
