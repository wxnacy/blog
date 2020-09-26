---
title: Hexo generate 页面的大小为 0
date: 2020-08-24 17:13:49
tags: [hexo]
---

才换了新电脑，想着尝鲜都用下新版本，Node 直接用了 14.8.0 版本，结果新特性还体会到，到引来了一些问题。

<!-- more -->
<!-- toc -->

Hexo 环境用 Dockerfile 配好，`hexo server` 是正常的，但是 `hexo generate` 就出了问题。

也没用报错，页面也都正常生成，但是用 nginx 就是访问不了，看了半天配置还以为是 nginx 哪出了问题。

结果最后看到 public 里面所有的文件大小都是 0，尴尬！！

Google 后发现果然是版本问题，换到当前稳定版本 12.18.3

再重新执行 `hexo g -f` 强制重新生成静态页面，果然一切正常。
