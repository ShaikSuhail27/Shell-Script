#!/bin/bash

# configure the gmail in the linux server

USERID=$(id -u)
DATE=$(date +%F-%H:%M:%S)
SCRIPTNAME=$0
LOGDIR=/tmp
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"


# Function to check the status is Success or Failure
VALIDATE () {
if [ $1 -ne 0 ]
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

yum update -y --exclude=kernel*  &>>$LOGFILE
VALIDATE $? "UPDATE"

yum -y install postfix cyrus-sasl-plain mailx &>>$LOGFILE
VALIDATE $? "INSTALLATION" 

systemctl enable postfix &>>$LOGFILE
VALIDATE $? "ENABLE" 

systemctl restart postfix &>>$LOGFILE
VALIDATE $? "RESTART"

cp Main.cf /etc/postfix/main.cf &>>$LOGFILE
VALIDATE $? "COPYING" 

touch /etc/postfix/sasl_passwd &>>$LOGFILE
VALIDATE $? "Creating the file for authentication" 

 echo "ENTER THE USERNAME : "
 read  USERNAME

 echo "ENTER THE password : "
 read -s PASSWORD

 echo "[smtp.gmail.com]:587 $USERNAME:$PASSWORD" >>  /etc/postfix/sasl_passwd

# [smtp.gmail.com]:587 $USERNAME:$PASSWORD"

#  cp SASL_PASSWD /etc/postfix/sasl_passwd &>>$LOGFILE
#  VALIDATE $? "adding the user name in file and copying for authentication" 

postmap /etc/postfix/sasl_passwd &>>$LOGFILE
VALIDATE $? "Postmap" 

echo "This is a test mail & Date $(date)" | mail -s "message" shaiksuhail2767@gmail.com &>>$LOGFILE
VALIDATE $? "sending the mail" 














