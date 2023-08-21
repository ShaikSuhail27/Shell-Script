#!/bin/bash

# configure the gmail in the linux server

USERID=$(id -u)
DATE=$(date +%F-%H:%M:%S)
SCRIPTNAME=$0
LOGDIR=/temp/
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log

# Function to check the status is Success or Failure
VALIDATE () {
if [ $1 -ne 0]
then
echo "$2 is  failure"
else
echo "$2 is  success"
fi
}

#To check whether it is root access or not
if [ $USERID -ne 0]
then
echo "ERROR:please run this with root access"
fi

yum update -y --exclude=kernel*
VALIDATE $? "UPDATE" &>> $LOGFILE

yum -y install postfix cyrus-sasl-plain mailx
VALIDATE $? "INSTALLATION" &>> $LOGFILE

systemctl enable postfix 
VALIDATE $? "ENABLE" &>> $LOGFILE

systemctl restart postfix 
VALIDATE $? "RESTART" &>> $LOGFILE






