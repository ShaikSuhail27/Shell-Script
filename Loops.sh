#!/bin/bash
DATE=$(date +%F-%H:%M:%S)
SCRIPTNAME=$0
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE() {
  if [ $1 -ne 0 ]
  then
  echo -e "$2:Installation is $R failure $N"
  exit 1
  else
  echo -e "$2:Installation is $G successful $N"
  fi
}

for packages in $@
do
if rpm -q "$packages" > /dev/null
then
echo "$packages is already installed"
else
yum install $packages -y &>>LOGFILE
fi
# if  [ $? -ne 0 ] 
# then
# echo "$packages: Installation is failure"
# exit 1
# else
# echo "$packages: Installation is Success"
# fi
VALIDATE $? $packages
done