#!/usr/bin/env bash
# Author: wxnacy(wxnacy@gmail.com)
# Description: 重启服务

docker stop blog && docker rm blog
docker-compose up --force-recreate -d blog
