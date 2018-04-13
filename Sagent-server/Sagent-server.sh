#!/bin/bash
# Function:
# 	Start tcpserver
# Date: 2018-04-03

# Get IP
IP=`hostname -I 2> /dev/null | awk '{print $1}'`
if [ "$IP" == "" ]
then
	IP=`hostname -i 2> /dev/null | awk '{print $1}'`
fi

port='54321'
program='./server.sh'

# Start tcpserver 
echo "Start tcpserver ..."
tcpserver -v 0 $port $program
