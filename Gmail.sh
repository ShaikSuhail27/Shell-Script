#!/bin/bash

# configure the gmail in the linux server

USERID=$(id -u)
DATE=$(date +%F-%H:%M:%S)
SCRIPTNAME=$0
LOGDIR=/temp/
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

# Function to check the status is Success or Failure
VALIDATE () {
if [ $1 -ne 0]
then
echo -e "$R $2 is  failure $N"
else
echo -e "$G $2 is  success $N"
fi
}

#To check whether it is root access or not
if [ $USERID -ne 0 ] 
then
echo -e "$R ERROR:please run this with root access $N"
fi

yum update -y --exclude=kernel*
VALIDATE $? "UPDATE" &>> $LOGFILE

yum -y install postfix cyrus-sasl-plain mailx
VALIDATE $? "INSTALLATION" &>> $LOGFILE

systemctl enable postfix 
VALIDATE $? "ENABLE" &>> $LOGFILE

systemctl restart postfix 
VALIDATE $? "RESTART" &>> $LOGFILE

cp Main.cf /etc/postfix/main.cf 
VALIDATE $? "COPYING" &>> $LOGFILE

touch /etc/postfix/sasl_passwd 
VALIDATE $? "Creating the file for authentication" &>> $LOGFILE

cp SASL_PASSWD /etc/postfix/sasl_passwd
VALIDATE $? "adding the user name in file and copying for authentication" &>> $LOGFILE

postmap /etc/postfix/sasl_passwd 
VALIDATE $? "Postmap" &>> $LOGFILE

echo "This is a test mail & Date $(date)" | mail -s "message" shaiksuhail2767@gmail.com
VALIDATE $? "sending the mail" &>> $LOGFILE














