---
title: Hexo 报错 the return value of (posts["first"])["updated"]["toISOString"]
date: 2021-04-17 16:40:54
tags: [hexo]
---

Hexo 报错 `the return value of (posts["first"])["updated"]["toISOString"]`

<!-- more -->
<!-- toc -->

最近在把博客项目做 docker 容器化，Dockerfile 变更的过程中发现如下错误。

```bash
08:30:29.765 FATAL Something's wrong. Maybe you can find the solution here: https://hexo.io/docs/troubleshooting.html
Template render error: (unknown path) [Line 8, Column 25]
  Error: Unable to call `the return value of (posts["first"])["updated"]["toISOString"]`, which is undefined or falsey
    at Object._prettifyError (/root/blog/node_modules/nunjucks/src/lib.js:36:11)
    at /root/blog/node_modules/nunjucks/src/environment.js:561:19
    at Template.root [as rootRenderFunc] (eval at _compile (/root/blog/node_modules/nunjucks/src/environment.js:631:18), <anonymous>:212:3)
    at Template.render (/root/blog/node_modules/nunjucks/src/environment.js:550:10)
    at Hexo.module.exports (/root/blog/node_modules/hexo-generator-feed/lib/generator.js:40:22)
    at Hexo.tryCatcher (/root/blog/node_modules/bluebird/js/release/util.js:16:23)
    at Hexo.<anonymous> (/root/blog/node_modules/bluebird/js/release/method.js:15:34)
    at /root/blog/node_modules/hexo/lib/hexo/index.js:318:20
    at tryCatcher (/root/blog/node_modules/bluebird/js/release/util.js:16:23)
    at MappingPromiseArray._promiseFulfilled (/root/blog/node_modules/bluebird/js/release/map.js:68:38)
    at MappingPromiseArray.PromiseArray._iterate (/root/blog/node_modules/bluebird/js/release/promise_array.js:115:31)
    at MappingPromiseArray.init (/root/blog/node_modules/bluebird/js/release/promise_array.js:79:10)
    at MappingPromiseArray._asyncInit (/root/blog/node_modules/bluebird/js/release/map.js:37:10)
    at _drainQueueStep (/root/blog/node_modules/bluebird/js/release/async.js:97:12)
    at _drainQueue (/root/blog/node_modules/bluebird/js/release/async.js:86:9)
    at Async._drainQueues (/root/blog/node_modules/bluebird/js/release/async.js:102:5)
    at Immediate.Async.drainQueues [as _onImmediate] (/root/blog/node_modules/bluebird/js/release/async.js:15:14)
    at processImmediate (internal/timers.js:456:21)
```

日志看应该跟 posts 目录有关，进入容器查看发现整个博客目录是空的。

再次检查 Dockerfile，发现因为调整了 WORKDIR 参数，但是 docker-compose.yml 文件中的文件映射却没有跟着改过来，真是被自己蠢哭了。

改正后再次打包运行，一切正常。
