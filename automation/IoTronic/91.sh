#!/bin/bash
hex=$3
str=`echo $3| perl -pe 's/(..)/chr(hex($1))/ge'`
STATUS=`echo ${str}| cut -f1 -d"|"`
DEV=`echo ${str}| cut -f3 -d"|"`


if [ "$STATUS" = 1 ]; then
   /usr/bin/curl -u user:password -X POST -d "btnpwr=on" "http://$DEV/index.html"  -m 1
	
elif [ "$STATUS" = 0 ]; then
    /usr/bin/curl -u user:password -X POST -d "btnpwr=off" "http://$DEV/index.html"  -m 1
fi




