---
title: pyenv 安装 Python 使用国内源
date: 2020-09-30 23:33:16
tags: [python]
---

用过 pyenv 的朋友应该都被它安装 Python 版本时巨慢的速度折磨过，究其原因还是国内访问官网的源速度上不去，所幸像其他软件的依赖包一样 Python 也有很多国内源。

<!-- more -->
<!-- toc -->

这里我使用的是淘宝的源 [https://npm.taobao.org/mirrors/python/](https://npm.taobao.org/mirrors/python/)

pyenv 没有配置源地址的地方，不过我们可以变通一下。

它安装 Python 的流程就是先将把包下载到 `~/.pyenv/cache` 目录，然后在进行安装，慢也就慢在下载的这个过程。

先手动将包下载到指定目录，在执行 `pyenv install` 即可。

精简一下 shell 命令如下

```bash
$ v=3.8.5; curl -L https://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -o ~/.pyenv/cache/Python-$v.tar.xz; pyenv install $v
```

我们也可以创建一个方法，放到 `~/.bashrc` 文件中，以后方便直接使用

```bash
function pyinstall() {
    v=$1
    echo '准备按照 Python' $v
    curl -L https://npm.taobao.org/mirrors/python/$v/Python-$v.tar.xz -o ~/.pyenv/cache/Python-$v.tar.xz
    pyenv install $v
}
```

```bash
$ pyinstall 3.8.0
```
