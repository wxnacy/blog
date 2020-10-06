---
title: Vim 插件 Youcompleteme 使用报错 The ycmd server SHUT DOWN
date: 2020-10-06 17:26:48
tags: [vim]
---

使用 YouCompleteMe 做 Vim 的代码补全插件已经好几年了，一直认为是最强大的补全工具。但是最近在新环境的安装却出现了问题。

<!-- more -->
<!-- toc -->

之前使用我自己总结的[方法](/2017/09/22/vim-plugin-youcompleteme/)来安装从未失手，但是最近新电脑的安装却出了问题。

安装的部分依然没有问题，但是在打开 Vim 后却报错，如下

```bash
The ycmd server SHUT DOWN (restart with ':YcmRestartServer'). Unexpected exit code 1. Type ':YcmToggleLogs ycmd_50908_stderr_uh8wjnhm.log' to check the logs.
```

因为执着于前面的信息，Google 了很久都不成功，最后看下后面的命令可以看到日志

```bash
:YcmToggleLogs ycmd_50908_stderr_uh8wjnhm.log
```

内容如下

```bash
Traceback (most recent call last):
  File "/Users/wxnacy/.pyenv/versions/3.6.10/Python.framework/Versions/3.6/lib/python3.6/runpy.py", line 193, in _run_module_as_main
    "__main__", mod_spec)
  File "/Users/wxnacy/.pyenv/versions/3.6.10/Python.framework/Versions/3.6/lib/python3.6/runpy.py", line 85, in _run_code
    exec(code, run_globals)
  File "/Users/wxnacy/.wvim/bundle/YouCompleteMe/python/ycm/../../third_party/ycmd/ycmd/__main__.py", line 193, in <module>
    Main()
  File "/Users/wxnacy/.wvim/bundle/YouCompleteMe/python/ycm/../../third_party/ycmd/ycmd/__main__.py", line 169, in Main
    from ycmd import handlers
  File "/Users/wxnacy/.wvim/bundle/YouCompleteMe/third_party/ycmd/ycmd/handlers.py", line 27, in <module>
    from ycmd import extra_conf_store, hmac_plugin, server_state, user_options_store
  File "/Users/wxnacy/.wvim/bundle/YouCompleteMe/third_party/ycmd/ycmd/server_state.py", line 22, in <module>
    from ycmd.completers.language_server import generic_lsp_completer
  File "/Users/wxnacy/.wvim/bundle/YouCompleteMe/third_party/ycmd/ycmd/completers/language_server/generic_lsp_completer.py", line 19, in <module>
    from ycmd.completers.language_server import language_server_completer
  File "/Users/wxnacy/.wvim/bundle/YouCompleteMe/third_party/ycmd/ycmd/completers/language_server/language_server_completer.py", line 28, in <module>
    from watchdog.events import PatternMatchingEventHandler
  File "/Users/wxnacy/.wvim/bundle/YouCompleteMe/third_party/ycmd/third_party/watchdog_deps/watchdog/build/lib3/watchdog/events.py", line 91, in <module>
    from pathtools.patterns import match_any_paths
ModuleNotFoundError: No module named 'pathtools'
```

能看到这些信息就很简单了，找不到包嘛，在 `~/.vim/bundle/YouCompleteMe` 目录下进行安装即可。

```bash
$ pip install pathtools
```

然后再次打开 Vim ，正常补全
