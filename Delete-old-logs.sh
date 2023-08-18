#/bin/bash

#To remove the log files more than 14 days

APP_LOG_DIR=/home/centos/app-logs
DATE=$(date +%F-%H:%M:%S)
SCRIPTNAME=$0
LOGDIR=/home/centos/shellscript-logs
LOGFILE=$LOGDIR/$SCRIPTNAME-$DATE.log

# Finding the log files inside the directory which is more than 14 days

LOGFILE_TO_FIND=$(find $APP_LOG_DIR -name "*.log" -type f -mtime +14)
#echo "$LOGFILE_TO_FIND"
echo "Script executing at $DATE"

# reading the file line by line and deleting
while read line
do
echo "deleting $line" &>> $LOGFILE
rm -rf $line
done <<< $LOGFILE_TO_FIND

