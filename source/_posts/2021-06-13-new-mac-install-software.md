---
title: 新 Mac 安装开发环境
tags:
  - mac
date: 2021-06-13 23:35:28
---


假设我么拿到一台新 Mac 电脑

<!-- more -->
<!-- toc -->

如果电脑没那么新，但是我们可以重装系统也可以，先进行如下操作

- [如何抹掉基于 Intel 的 Mac](https://support.apple.com/zh-cn/HT208496)
- [如何抹掉搭载 Apple 芯片的 Mac](https://support.apple.com/zh-cn/HT212030)
- [重新安装 macOS](https://support.apple.com/zh-cn/guide/mac-help/mchlp1599/mac)

好了，现在我们真的有了一台新 Mac 电脑

## 触控板和键位

先做些基础改动，如果你是比较新的系统，一定会有几点回比较别扭

比如：不能轻点来点按，触控板也不是很跟手

可以按照几个步骤进行设置，`系统设置偏好 -> 触控板`

![/images/mac-chukong1.png](/images/mac-chukong1.png)

还有一个功能让老用户很蛋疼，MacOS 默认去掉了三指拖动窗口，这个隐藏的比较深

`系统设置偏好 -> 辅助功能 -> 指针选项 -> 触控板选项`

![/images/mac-chukong2.png](/images/mac-chukong2.png)

## shell 环境

### iTerm2

Mac 自带的 terminal 客户端显然不够看，直接上 iTerm2

直接下载安装即可

[https://iterm2.com/downloads.html](https://iterm2.com/downloads.html)

需要注意的是安装的时候会提示安装开发工具，这一步一定要点击确定，并等待它安装完成

后续很多软件的安装都需要里面的基础工具，比如 git

### Homebrew

Linux 有 `yum/apt` 等软件管理工具，幸好 Mac 也有大牛开发的 Homebrew

鉴于国内的网络环境，我推荐使用另一个国内大牛开发的安装脚本，按照提示一步一步来，速度刚刚的

[https://gitee.com/cunkai/HomebrewCN](https://gitee.com/cunkai/HomebrewCN)

安装后再看下官方文档学习下怎么使用

[https://brew.sh/](https://brew.sh/)

### zsh

好马要有好鞍，有了上等的 Terminal，当然还配上等的 sh

Zsh，现在最好的 sh 非他莫属了

先来安装

[Zsh 与 oh-my-zsh 安装与使用](https://wxnacy.com/2017/08/16/shell-2017-08-16-zsh-install/)

为了方便我对自己的 zsh 环境做了管理，安装非常简单

[https://github.com/wxnacy/wzsh](https://github.com/wxnacy/wzsh)

如果你使用了很久 zsh，并配置了很多环境变量，时间久了每次 zsh 会变的很快，那可以看看这篇文章

[Zsh 加载速度优化](https://wxnacy.com/2019/04/04/zsh-speed-optimization/)


## 开发环境

未完待续
