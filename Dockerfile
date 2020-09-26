# 开始之前请在当前目录执行命令
# wget http://gosspublic.alicdn.com/ossutil/1.6.19/ossutil64 && chmod 755 ossutil64
# 如果 ossutil 需要使用新版本，参考
# https://help.aliyun.com/document_detail/120075.html?spm=a2c4g.11186623.6.832.36381c7aWlLuCZ
FROM node:12.18.3-slim

MAINTAINER wxnacy <wxnacy@gmail.com>

# 设置工作目录
ARG WORK_DIR="/work"
WORKDIR ${WORK_DIR}

COPY package.json ${WORK_DIR}
COPY package-lock.json ${WORK_DIR}

RUN yarn config set registry https://registry.npm.taobao.org/ \
    && yarn global add hexo-cli \
    && yarn
# RUN cnpm install co
# RUN cnpm install pm2 -g

COPY ossutil64 /usr/bin/ossutil

CMD ["hexo", "server", "--draft", "--debug"]
# CMD ["pm2", "start", "pm2-config.json"]

# docker build -t wxnacy/hexo .
# hexo g -f
