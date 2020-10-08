---
title: 使用 Python 解析 Chrome 浏览器书签
tags:
  - python
  - chrome
date: 2020-10-02 21:34:21
---


Chrome 浏览器的书签如果可以导出，并转换为我们需要的格式时，我们就可以编写各种插件来配合书签的使用。

<!-- more -->
<!-- toc -->

答案显然是可以的，接下来我们以 Python 为例写一个遍历打印书签的例子

## 书签地址

先来说下获取书签的方法

Chrome 浏览器的书签存放位置在各个平台的区别

**Mac**

```bash
~/Library/Application Support/Google/Chrome/Default/Bookmarks
```

**Linux**

```bash
~/.config/google-chrome/Default/Bookmarks
```

**Windows**

```bash
%LOCALAPPDATA%"\Google\Chrome\User Data\Default\Bookmarks"
```

## 书签结构

书签内容为 JSON 格式，结构如下

```json
{
    "checksum":"b196f618a9166d56dc6c98cfe9a98d45",
    "roots":{
        "bookmark_bar":{
            "children":[
                {
                    "date_added":"13246172853099058",
                    "guid":"83431411-157f-45f8-a9a4-d9af26c71bce",
                    "id":"1944",
                    "name":"blog local 温欣爸比的博客",
                    "type":"url",
                    "url":"http://localhost:4000/"
                },
                {
                    "children":[
                        {
                            "date_added":"13246172853099058",
                            "guid":"83431411-157f-45f8-a9a4-d9af26c71bce",
                            "id":"1944",
                            "name":"blog local 温欣爸比的博客",
                            "type":"url",
                            "url":"http://localhost:4000/"
                        }
                    ],
                    "date_added":"13246172844427649",
                    "date_modified":"13246172865895702",
                    "guid":"6aa4ecce-a220-4689-9239-7df10965748b",
                    "id":"1943",
                    "name":"Blog",
                    "type":"folder"
                }
            ],
            "date_added":"13242060909278534",
            "date_modified":"13246172853099058",
            "guid":"00000000-0000-4000-a000-000000000002",
            "id":"1",
            "name":"书签栏",
            "type":"folder"
        },
        "other":{
            "children":[

            ],
            "date_added":"13242060909278616",
            "date_modified":"0",
            "guid":"00000000-0000-4000-a000-000000000003",
            "id":"2",
            "name":"其他书签",
            "type":"folder"
        },
        "synced":{
            "children":[

            ],
            "date_added":"13242060909278621",
            "date_modified":"0",
            "guid":"00000000-0000-4000-a000-000000000004",
            "id":"3",
            "name":"移动设备书签",
            "type":"folder"
        }
    },
    "sync_metadata":"",
    "version":1
}
```

清晰了这个结构在写代码就很简单了，以书签栏为例，只需要将 `data['roots']['bookmark_bar']['children']` 进行循环遍历即可，代码详情可见 [demo](https://github.com/wxnacy/study/blob/master/python/simple/single_line_progress.py)
