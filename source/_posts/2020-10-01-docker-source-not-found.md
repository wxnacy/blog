---
title: Docker build 时提示 source not found
tags:
  - docker
date: 2020-10-01 00:19:35
---


在执行 `docker build` 时报错 `source: not found`，有点错愕，Google 后才知道 `build` 时默认使用的是 `/bin/sh` 环境，`/bin/bash` 才可以使用 `source`。

<!-- more -->
<!-- toc -->

下面我们有两种方式可以生效

**执行该命令时指定 `/bin/bash` 环境**

```bash
RUN /bin/bash -c "source ~/.bashrc"
```

**指定全局 shell 环境**

```bash
SHELL ["/bin/bash", "-c"]
RUN && source ~/.bashrc
```
