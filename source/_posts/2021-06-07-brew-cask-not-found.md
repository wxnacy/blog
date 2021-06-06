---
title: Homebrew 报错 Unknown command cask
date: 2021-06-07 00:17:37
tags: [Mac, Homebrew]
---

在 Mac 最新系统 Big Sur 中安装 Homebrew 后使用 `brew cask` 命令报错

<!-- more -->
<!-- toc -->

```bash
Error: Unknown command: cask
```

原因在 Homebrew 新版本已经去掉了 cask 命令，改为如下方式

```bash
> $ brew install --cask xxx
```
