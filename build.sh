#!/usr/bin/env bash
# Author: wxnacy(wxnacy@gmail.com)
# Description: 

docker build -t wxnacy/hexo:1.0.0 .
docker build -t wxnacy/hexo:latest .
docker-compose up --force-recreate -d blog