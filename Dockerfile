# 开始之前请在当前目录执行命令
# ./bin/download_ossutil
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

# 安装依赖包
RUN yarn --registry https://registry.npm.taobao.org/
RUN yarn global add hexo-cli --registry https://registry.npm.taobao.org/ \
    && yarn add co --registry https://registry.npm.taobao.org/

# 添加 ossutil
COPY bin/ossutil64 /usr/bin/ossutil
# 添加命令缩写
COPY bin/.bash_aliases /root/.bash_aliases
RUN echo "if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi" >> /root/.bashrc

# 时区
ENV TZ Asia/Shanghai
# 支持中文字符集
# ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8


CMD ["hexo", "server", "--draft", "--debug"]

# ./bin/build_docker 1.0.4
# hexo g -f
