#!/bin/bash

#My sql and postfix installation

#to find whether we are in root acess or not

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "ERROR:please go to root access for any installation purpose"
fi