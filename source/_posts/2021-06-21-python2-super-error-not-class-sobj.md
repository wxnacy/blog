---
title: python2 报错 'super() argument 1 must be type, not classobj'
date: 2021-06-21 12:59:31
tags: [python, py2]
---

python2 使用 `super` 时报错

<!-- more -->
<!-- toc -->

```bash
super() argument 1 must be type, not classobj
```

在python2.2版本之前，直接调用超类的方法，后来改成通过super来调用，原因是为了解决多重继承中的钻石形状问题。

python里的super只能用在新式类中，不能用于以前的经典类，如果基类是经典类则会出现这个错误。

将第一个父类继承 object 即可。

```python
#!/usr/bin/env python
# -*- coding:utf-8 -*-
# Author: wxnacy(wxnacy@gmail.com)

class BaseModel(object):
    pass


class TestSub(BaseModel):

    def __init__(self):
        super(TestSub,self).__init__()
```
