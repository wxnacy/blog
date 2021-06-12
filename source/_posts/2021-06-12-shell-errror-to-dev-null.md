---
title: Shell 命令隐藏错误输出
date: 2021-06-12 22:56:06
tags: [shell]
---

想要知道怎么样隐藏 shell 命令的错误输出，先了解几个输入输出的基础概念

<!-- more -->
<!-- toc -->

```bash
0 标准输入流(stdin)
1 标准输出流(stdout)
2 标准错误流(stderr)
& 表示等同于的意思
> 重定向
```

接下来准备一个脚本 `test_error`

```bash
#!/usr/bin/env bash

echo 'w'
ss
```

运行如下

```bash
> $ ./test_error
w
./test_error: line 5: ss: command not found
```

常见的几种重定向写法

将标准输出流重定向到黑洞

```bash
> $ ./test_error >/dev/null
./test_error: line 5: ss: command not found
```

将错误物流重定向到标准输出流，并将标准输出流重定向到黑洞

```bash
> $ ./test_error >/dev/null 2>&1
```

由此我们推断下只隐藏错误输出的写法

```bash
> $ ./test_error 2>/dev/null
w
```

成功!
