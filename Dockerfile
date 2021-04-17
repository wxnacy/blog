# 开始之前请在当前目录执行命令
# wget http://gosspublic.alicdn.com/ossutil/1.6.19/ossutil64 && chmod 755 ossutil64
# 如果 ossutil 需要使用新版本，参考
# https://help.aliyun.com/document_detail/120075.html?spm=a2c4g.11186623.6.832.36381c7aWlLuCZ
FROM node:12.18.3-slim

# 作者
MAINTAINER wxnacy <wxnacy@gmail.com>

# 设置工作目录
ARG WORK_DIR="/root/blog"
WORKDIR ${WORK_DIR}

COPY package.json ${WORK_DIR}
COPY package-lock.json ${WORK_DIR}
COPY ossutil64 /usr/bin/ossutil

# 安装依赖包
RUN yarn --registry https://registry.npm.taobao.org/
RUN yarn global add hexo-cli --registry https://registry.npm.taobao.org/ \
    && yarn add co --registry https://registry.npm.taobao.org/

# 添加命令缩写
COPY .bash_aliases /root/.bash_aliases
RUN echo "if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi" >> /root/.bashrc

# 时区
ENV TZ Asia/Shanghai
# 支持中文字符集
# ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

# ARG PROP=/root/.bashrc
# SHELL ["/bin/bash", "-c"]
# RUN echo "export TZ='Asia/Shanghai'" >> ${PROP} \
  # && source ${PROP}


CMD ["hexo", "server", "--draft", "--debug"]

# docker build -t wxnacy/hexo .
# docker build -t wxnacy/hexo:1.0.0 .
# hexo g -f
