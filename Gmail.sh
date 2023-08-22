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
MAIN_CONFIG="relayhost = [smtp.gmail.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_sasl_tls_security_options = noanonymous"

FILENAME="/etc/postfix/main.cf"

# Function to check the status is Success or Failure
VALIDATE () {
if [ $1 -ne 0 ]
then
echo -e "$2 is  $R failure$N"
exit 1
else
echo -e "$2 is  $G success$N"
fi
}

#To check whether it is root access or not
if [ $USERID -ne 0 ] 
then
echo -e "$R ERROR:please run this with root access$N" 
exit 1
fi

yum update -y --exclude=kernel*  &>>$LOGFILE
VALIDATE $? "UPDATE"

yum -y install postfix cyrus-sasl-plain mailx &>>$LOGFILE
VALIDATE $? "INSTALLATION" 

systemctl enable postfix &>>$LOGFILE
VALIDATE $? "ENABLE" 

systemctl restart postfix &>>$LOGFILE
VALIDATE $? "RESTART"

# cp Main.cf /etc/postfix/main.cf &>>$LOGFILE
#cat Main.cf >> /etc/postfix/main.cf &>>$LOGFILE
#cat "$MAIN_CONFIG" >> /etc/postfix/main.cf &>>$LOGFILE
cat "$FILENAME" >> "$MAIN_CONFIG"  &>>$LOGFILE
VALIDATE $? "appending" 

touch /etc/postfix/sasl_passwd &>>$LOGFILE
VALIDATE $? "Creating the file for authentication" 

 echo "ENTER THE USERNAME : "
 read  USERNAME

 echo "ENTER THE password : "
 read  PASSWORD

 echo "[smtp.gmail.com]:587 $USERNAME:$PASSWORD" >> /etc/postfix/sasl_passwd

# [smtp.gmail.com]:587 $USERNAME:$PASSWORD"

#  cp SASL_PASSWD /etc/postfix/sasl_passwd &>>$LOGFILE
#  VALIDATE $? "adding the user name in file and copying for authentication" 

postmap /etc/postfix/sasl_passwd &>>$LOGFILE
VALIDATE $? "Postmap" 

echo "This is a test mail & Date $(date)" | mail -s "message" shaiksuhail2727@gmail.com 
VALIDATE $? "sending the mail" 














