---
title: Java9 以后不再推荐使用 clazz.newInstance() 方法
tags:
  - java
date: 2021-06-06 21:01:32
---


Java9 以后不再推荐使用 `clazz.newInstace()` 方法，而是换成

<!-- more -->
<!-- toc -->

```java
clazz.getDeclaredConstructor().newInstance()
```

首先使用 `getDeclaredConstructor` 方法获取默认无参数的构造器，如果类中没有无参数构造器则会抛出异常 `ClassNotFoundException`。

下面是使用反射来实现 `List` 接口的例子。

```java
package com.wxnacy.common.test;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        Main.class.newInstance()
        try {
            List list = (List) Class.forName("java.util.ArrayList").getDeclaredConstructor().newInstance();
            list.add("wxnacy");
            System.out.println("list = " + list);
        } catch (ClassNotFoundException | NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

    }
}
```
