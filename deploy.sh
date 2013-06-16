#!/usr/bin/env bash

dir_input="_site"
dir_output="_deploy"
remote_url=`git config --get remote.origin.url`
cur_time=`date`

rm -rf $dir_output
mkdir -p $dir_output
cp -r $dir_input/* $dir_output

cd $dir_output

git init .
git checkout --orphan gh-pages
git remote add deploy $remote_url
git add .
git add -u .
git commit -m "Update Site: $cur_time"
git push deploy gh-pages --force

cd -
