---
title: Mongo 常用命令
tags:
  - mongo
date: 2021-06-14 01:04:37
---

记录 mongo 常用的命令

<!-- more -->
<!-- toc -->

## 查询

```
# 查询列表
> db.collections.find()

# 查询一条文档
> db.collections.findOne({ _id: ""})

# 过滤字段
> db.collections.findOne({}, { _id: 1 })

# 返回指定条数的列表
> db.collections.find().limit(1)

# 排序 1 正序 -1 倒序
> db.collections.find().sort({ create_time: 1})

# 查询条件 exists
> db.collections.find({ field_name: { $exists: true } })

# 查询条件 in
> db.collections.find({ field_name: { $in: [ 1, 2 ] } })

# 查询条件 大于 gt 小于 lt
> db.collections.find({ field_name: { $gt: 1 } })

# 查询条件 大于等于 gte 小于等于 lte
> db.collections.find({ field_name: { $gte: 1 } })

# 分片时，查询 is_check = 0 的数量
> db.collections.aggregate([{$match:{is_check:0}},{$group:{_id: null,count:{$sum:1}}}])
```

## 插入

```
# 插入数据
> db.collections.insert({ name: "wxnacy" })
```
