#! /bin/bash/

USERID=$(id -u)
if [ $USERID -ne 0 ] # id is not equal to zero then it is normal user or else root root user
then
echo "Error:This is not a root user and please go to root access for installing"
exit 1 #$? is not equal to zero then it is failure 
fi
yum install mysqll -y
if [ $? -ne 0 ] then
    echo "There is error in Mysql installation"
    exit 1
else
echo "MySql installation is success"
fi


