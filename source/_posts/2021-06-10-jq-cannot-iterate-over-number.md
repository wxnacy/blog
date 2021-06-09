---
title: jq 报错 Cannot iterate over number
date: 2021-06-10 00:37:42
tags: [linux, jq]
---

在使用 jq 做解析的时候一直报错，如下

<!-- more -->
<!-- toc -->

```bash
jq: error (at <stdin>:1): Cannot iterate over number (133)
```

原始数据如下

```json
{
    "data": {
        "total": 133
        "data": [
            {
                "name": "xxx"
            },
            ...
            {
                "name": "xxx"
            }
        ]
    }
}
```

使用方式

```bash
>$ cat data.json | jq '.data[]' | jq '.[].name'
```

现在看来错误很明显，133 数字无法被遍历。

但是实际在使用时，因为内层 `data` 列表数据太大，倒是无法看到上面的数据结构，结果只用一层 `data` 来获取，结果自然不对。

修改如下后即可

```bash
>$ cat data.json | jq '.data.data[].name'
"xxx"
"xxx"
```

如果想要返回的数据中不带有双引号，则带上参数 `-r` 即可，它可以把数据作为字符串对待。

```bash
>$ cat data.json | jq -r '.data.data[].name' 
xxx
xxx
```
