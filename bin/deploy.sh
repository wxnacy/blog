#!/usr/bin/env bash
# Author: wxnacy(wxnacy@gmail.com)
# Description: 发布到 oss
# ossutil 文档: https://help.aliyun.com/document_detail/120075.html?spm=a2c4g.11186623.6.732.36381c7aWzhGGo
# 安装
# curl -o /usr/local/bin/ossutil https://gosspublic.alicdn.com/ossutil/1.7.10/ossutilmac64 && chmod 755 /usr/local/bin/ossutil

env=$1
bucket=blog-test-cn
if [[ $env == 'prod' ]]
then
  bucket=blog-cn
fi
echo "部署 ${bucket}"

ossutil -i ${OSS_ACCESS_KEY_ID} -k ${OSS_ACCESS_KEY_SECRET} -e ${OSS_ENDPOINT} \
  cp public oss://${bucket}/ -rfu --jobs 100

# pytext="import os;names = os.listdir('public'); print(names)"

# files=`python -c "import os;names = os.listdir('public'); names =['public/' + o + '/' if os.path.isdir('public/' + o) else 'public/' +o for o in names]; print(str(names))"`
# files=`python -c ${pytext}`
# echo $files


# for f in  $files
# do
  # echo $f
  # if [[ $f == */ ]]
  # then
    # ossutilmac64 cp $f oss://${bucket}/$f -rfu
  # else
    # ossutilmac64 cp $f oss://${bucket}/$f -fu
  # fi

# done

