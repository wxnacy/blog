---
title: Centos7 安装 Python3
date: 2020-10-08 23:28:05
tags: [linux]
---

Centos7 安装 Python3 常用的有两种方式**编译**和**EPEL**

<!-- more -->
<!-- toc -->

## 编译安装

先来说编译安装，这里以 3.6 版本为例。

首先安装构建 Python3 环境所需的软件依赖

```bash
$ sudo yum-builddep -y python
```

如果找不到 `yum-builddep` 命令可以进行安装 `sudo yum install -y yum-utils`

这里下载安装包时推荐国内源，比如[阿里云](https://npm.taobao.org/mirrors/python/)，使用官网的源要慢到你怀疑人生。

```bash
$ curl -L https://npm.taobao.org/mirrors/python/3.6.12/Python-3.6.12.tar.xz -o Python-3.6.12.tar.xz
```

编译安装

```bash
$ tar -xvf Python-3.6.12.tar.xz
$ cd Python-3.6.12
$ ./configure
$ make
$ sudo make install
```

安装目录默认为 `/usr/local`，如果想要改变需要在编译时指定 `./configure --prefix=/usr`

另外，如果 `make` 命令找不到也需要提前安装 `sudo yum install -y gcc automake autoconf libtool make`

## EPEL 仓库安装

EPEL 安装就简单了许多非常适合小白使用

```bash
$ sudo yum install -y epel-release
$ sudo yum install -y python36
```

然后等待就可以了，但是这个等待真的不是一般的慢，归根结底还是源的问题，并且安装的版本也会比较落后。

综上优先推荐编译安装的方式。

