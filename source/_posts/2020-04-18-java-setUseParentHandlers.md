---
title: Java 日志禁用屏幕输出
tags:
  - java
date: 2020-04-18 23:13:42
---


Java 使用 `java.util.logger` 包来进行日志输出时，默认屏幕输出是没有关闭的。

<!-- more -->
<!-- toc -->

及时设置了文件 `Handler` 也无法屏蔽，显示效果依然有红字输出。

![/images/java-logger1.png](/images/java-logger1.png)

此时需要设置不使用父类 `Headler` 才可以屏蔽掉该输出

```java
logger.setUseParentHandlers(false);
```