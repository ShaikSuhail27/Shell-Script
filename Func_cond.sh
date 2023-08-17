#!/bin/bash

#My sql and postfix installation

#to find whether we are in root acess or not

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR:please go to root access for any installation purpose"
exit 1 # if any error occurs in shellscript it will not stop by default and we are responsible to stop, if $? =0(success) or $?=(1-127(error))
fi

yum install mysqll -y #My sql installation
if [ $? -ne 0] 
then 
echo "Installation is Failure"
exit 1
else
echo "Installation is Success"
fi

