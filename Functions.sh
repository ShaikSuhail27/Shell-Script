#! /bin/bash/

USERID=$(id -u)
DATE=$(date +%F-%H:%M:%S)
SCRIPTNAME=$0
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log
RED="\e[31m"
green="\e[32m"
Normal="\e[0m"

# this function is used to validate the previous comands status and inform user whether it is successful or not
VALIDATE (){

     if [ $1 -ne 0 ]
     then
        echo -e "$2 Installation is $RED Failure $Normal" 
        exit 1
     else
        echo -e "$2 Installation is $green Success $Normal"
fi
}
if [ $USERID -ne 0 ] # id is not equal to zero then it is normal user or else root root user
then
echo "Error:This is not a root user and please go to root access for installing"
exit 1 #$? is not equal to zero then it is failure 
fi
yum install mysql -y &>>$LOGFILE
VALIDATE $? "MYSQL" 

yum install postfixx -y &>>$LOGFILE
VALIDATE $? "POSTFIX"

