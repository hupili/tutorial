#!/usr/bin/env bash

PWD=`pwd`

dir_input="$PWD/webpage"

cd $dir_input
jekyll build

