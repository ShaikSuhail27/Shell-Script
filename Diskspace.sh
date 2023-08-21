#!/bin/bash

#If the diskspace exceeds the threshold it will send alert mails

LOGDIR=/tmp
DATE=$(date +%F-%H:%M:%S)
SCRIPTNAME=$0
LOGFILE=$LOGDIR/$SCRIPTNAME-$DATE.log

#to find the disk usage
DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_THRESHOLD=1

while IFS= read line
do
#this command is used to print the diskusage in number
usage =$($line | awk '{print$6}' | cut -d% -f1)
partition=$($line | awk '{print$1}')
if [ $usage -ge $DISK_THRESHOLD ]
then
echo "Disk space is using more for this $partition : $usage"
fi
done <<< $DISK_USAGE

echo "message:$message"