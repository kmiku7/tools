#!/bin/sh
# 
# Author: kmiku7 <kakoimiku@gmail.com>
# File: vi_diff.sh
#
# Brief:
#   for SVN
#

# 指定vimdiff路径
# DIFF="/usr/bin/vimdiff"

# svn提供第六个和第七个参数作为base和本地罪行的文本文件作为输入
LEFT=${6}
RIGHT=${7}

# 调用vimdiff做比较
$DIFF $LEFT $RIGHT
