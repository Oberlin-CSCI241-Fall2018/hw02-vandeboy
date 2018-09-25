#!/bin/sh
# Peng Gu and Yifan Chen
# 09/23/2018
# linecount.sh
# This file counts the total line number of all files in the current directory and ignores folders. If the user enters a glob pattern from command line for a type of files, the linecount will only count those files.

total=0
count=0
if [ -z "$1" ]; then
    for file in *; do
	if [ -f $file ]; then
	    count=`cat $file | wc -l`
	    total=`expr $count + $total`
	fi
    done
else
    for file in *; do
	if [ $file = $1 ] && [ -f $file ]; then
	    count=`cat $file | wc -l`
	    total=`expr $count + $total`
	fi
    done
fi
echo $total

