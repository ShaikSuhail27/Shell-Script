#! /bin/bash/

USERID=$(id -u)
DATE=$(date +%F-%H:%M:%S)
SCRIPTNAME=$0
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log
# this function is used to validate the previous comands status and inform user whether it is successful or not
VALIDATE (){
    if ($1 -ne 0)
then
    echo "$2 Installation is Failure" 
    exit 1
else
    echo "$2 Installation is Success"
fi
}
if [ $USERID -ne 0 ] # id is not equal to zero then it is normal user or else root root user
then
echo "Error:This is not a root user and please go to root access for installing"
exit 1 #$? is not equal to zero then it is failure 
fi
yum install mysql -y &>>$LOGFILE
VALIDATE $? "MYSQL" 

yum install postfix -y &>>$LOGFILE
VALIDATE $? "POSTFIX"

