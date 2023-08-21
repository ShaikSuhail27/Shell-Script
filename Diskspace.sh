#!/bin/bash

#If the diskspace exceeds the threshold it will send alert mails

LOGDIR=/tmp
DATE=$(date +%F-%H:%M:%S)
SCRIPTNAME=$0
LOGFILE=$LOGDIR/$SCRIPTNAME-$DATE.log

#to find the disk usage
DISK_USAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_THRESHOLD=1
message=""

while IFS= read line
do
#this command is used to print the diskusage in number
usage=$(echo $line | awk '{print $6}' | cut -d% -f1)
partition=$(echo $line | awk '{print $1}')
if [ $usage -gt $DISK_THRESHOLD ];
then
message+="Disk space is using more for this $partition : $usage /n"
fi
done <<< $DISK_USAGE

echo "message:$message"