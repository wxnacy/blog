#!/usr/bin/env bash
# Author: wxnacy(wxnacy@gmail.com)
# Description:

docker run --name hexo \
-v /Users/wxnacy/Projects/blog:/opt/hexo \
-p 8080:80 \
-d idiswy/hexo:latest
