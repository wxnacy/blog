---
title: Yarn 如何使用国内源
date: 2020-09-26 16:44:39
tags: [node]
---

当你看到这篇文章，你遇到的问题多半是默认源速度太慢了，那首先我们先来看下适合你网速的源。

<!-- more -->
<!-- toc -->

## yrm - YARN 源管理

[yrm](https://github.com/i5ting/yrm) 可以快速切换镜像源，还可以测试自己网络访问不同源的速度

**安装**

```bash
$ npm install -g yrm
```

**查看支持的源**

```bash
$ yrm ls

* npm ---- https://registry.npmjs.org/
  cnpm --- http://r.cnpmjs.org/
  taobao - https://registry.npm.taobao.org/
  nj ----- https://registry.nodejitsu.com/
  rednpm - http://registry.mirror.cqupt.edu.cn/
  npmMirror  https://skimdb.npmjs.com/registry/
  edunpm - http://registry.enpmjs.org/
  yarn --- https://registry.yarnpkg.com
```

**测试速度**

先来测试下速度

```bash
$ yrm test taobao
```

下面是我的环境分别测试的各个环境的速度

```bash
  cnpm --- 1784ms
* npm ---- 1881ms
  taobao - 170ms
  nj ----- Fetch Error
  rednpm - Fetch Error
  npmMirror  1606ms
  edunpm - Fetch Error
  yarn --- Fetch Error
```

**使用**

测试结果很明显，下面可以直接使用

```bash
$ yrm use taobao
```

## 直接使用

当然多数情况下，我们不想做这么多前置操作，直接使用就好了。

下面有两种方式可以方便引入

**临时使用**

```bash
$ yarn save <software> --registry https://registry.npm.taobao.org/
```

**全局配置**

```bash
$ yarn config set registry https://registry.npm.taobao.org/
```

我们可以查看当前使用的仓库源

```bash
$ yarn config get registry
```
