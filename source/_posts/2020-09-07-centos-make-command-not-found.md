---
title: Centos 报错 make command not found
date: 2020-09-07 19:34:31
tags: [linux]
---

在使用 Docker 构建镜像走到编译软件的步骤时会报这个错误，显然是 `make` 命令还么有被安装。

<!-- more -->
<!-- toc -->

一般依赖的镜像都是比较小的系统，很多常用工具都没有安装，此时需要手动安装一下

```bash
$ yum install -y gcc automake autoconf libtool make
```
