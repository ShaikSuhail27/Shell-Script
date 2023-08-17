#! /bin/bash/

USERID=$(id -u)
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
yum install mysql -y
VALIDATE $? "MYSQL" 

yum install postfix -y
VALIDATE $? "POSTFIX"

