#!/bin/bash


cmd=$1
echo "$cmd" >&7
while read -u 6 result
do
	output=$(echo "$result" | awk -F ':' '{print $2}')
	if [ "$output" == "" ]
	then
		echo -e "$result \t~"
	else
		echo "$result"
	fi
done
