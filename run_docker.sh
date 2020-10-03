#!/usr/bin/env bash
# Author: wxnacy(wxnacy@gmail.com)
# Description:

# docker run --name hexo \
# -v /Users/wxnacy/Projects/blog:/opt/hexo \
# -p 8080:80 \
# -d idiswy/hexo:latest

docker run --name hexo-blog \
-v /Users/wxnacy/Projects/blog:/work \
-d hexo-blog:latest "while 1;do echo 1;done"
