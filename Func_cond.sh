#!/bin/bash

#My sql and postfix installation

#to find whether we are in root acess or not

USERID=$(id -u)

VALIDATE() { 

if [ $1 -ne 0 ] 
then 
echo "$2 Installation is Failure"
exit 1
else
echo "$2 Installation is Success"
fi

}

if [ $USERID -ne 0 ]
then
echo "ERROR:please go to root access for any installation purpose"
exit 1 # if any error occurs in shellscript it will not stop by default and we are responsible to stop, if $? =0(success) or $?=(1-127(error))
fi

yum install mysql -y #My sql installation
VALIDATE $? "MY SQL"
# if [ $? -ne 0 ] 
# then 
# echo "My SQL Installation is Failure"
# exit 1
# else
# echo "MY SQL Installation is Success"
# fi

yum install postfix -y # PostFix installation
VALIDATE $? "POST FIX"
# if [ $? -ne 0 ] 
# then 
# echo "PostFIX Installation is Failure"
# exit 1
# else
# echo "PostFIX Installation is Success"
# fi


