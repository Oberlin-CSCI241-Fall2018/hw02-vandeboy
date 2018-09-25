#!/bin/sh
#Peng Gu and Yifan Chen
#This file tests if the urls user enter are valid urls

while IFS= read -r urls;
do
    if curl --output /dev/null --silent --head --fail "$urls"; then
	echo $urls > out.txt
    else
	echo "$urls does not exist"
    fi
done < $1

