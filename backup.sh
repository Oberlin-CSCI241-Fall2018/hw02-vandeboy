#!/bin/sh
# Peng Gu and Yifan Chen
# 09/22/2018
# backup.sh
# This program checks if the designated file or folder has no newer copy in the backup folder, and in this case copies the file to backup folder. This program can copy multiple files and directories in one time from command line

num=1
backup="$1"
if [ ! -e $backup ]; then
    mkdir $backup
fi
while [ $num -lt $# ]
do
    if [ ! -e "$2" ]; then
	printf "the %d th file doesn't exist\n" $num
	shift 1
	num=`expr $num + 1`
	continue
    fi
    if [ "$2" -nt "$backup/$2" -o ! -f "$backup/$2" ]
    then
	cp -rf "$2" $backup
    fi
    shift 1
    num=`expr $num + 1`
done



