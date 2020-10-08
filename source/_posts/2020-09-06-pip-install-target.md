---
title: pip 安装包到指定目录
date: 2020-09-06 21:32:26
tags: [python]
---

一般情况下 Python 都是直接安装到全局环境，不过有些情况我们希望将依赖安装到当前目录，方便功能的迁移，比如开发 Alfred 插件。

<!-- more -->
<!-- toc -->

实现起来也很简单，一个参数就可以搞定

```bash
$ pip install --target=./ packagename
```
