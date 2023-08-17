#! /bin/bash/

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
echo "Error:This is not a root user"
fi