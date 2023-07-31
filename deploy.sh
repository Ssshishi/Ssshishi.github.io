#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e


push_addr='git@github.com/Ssshishi/Ssshishi.github.io.git' # git提交地址
commit_info=`git describe --all --always --long`
dist_path=docs/.vuepress/dist # 打包生成的文件夹路径
push_branch=main # 推送的分支

# 生成静态文件
yarn build

# 进入生成的文件夹
cd $dist_path

git init
git add -A
git commit -m "deploy, $commit_info"
git push -f $push_addr HEAD:$push_branch

cd -
rm -rf $dist_path
