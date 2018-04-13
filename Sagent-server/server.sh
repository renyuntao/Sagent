#!/bin/bash

read message

info=$(echo $message | awk -F ':' '{print $1}')
cmd=$(echo $message | awk -F ':' '{print $2}')
hostname=`hostname`

md5=$(echo -n "$info" | md5sum | awk '{print $1}')
if [ "$md5" != "1db715c16040ff3303b6604dd2f3fc30" ]
then
	echo -e "===> $hostname:\tPermission deny!"
	exit 1
fi

cmd=`echo $cmd | sed 's/\\r//'`
result=`sh -c "($cmd) | xargs"`
# result=`sh -c "($cmd)" | sed ':a;N;$!ba;s/\n/|/g'`
echo -e "==> $hostname: \t$result"
