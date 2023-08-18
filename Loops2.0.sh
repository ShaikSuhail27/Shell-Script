#!/bin/bash
USERID=$(id -u)
DATE=$(date +%F-%H:%M:%S)
SCRIPTNAME=$0
LOGDIR=/home/centos/shellscript-logs
LOGFILE=$LOGDIR/$0-$DATE.log
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

VALIDATE() {
  if [ $1 -ne 0 ]
  then
  echo -e "$2:Installation is $R failure $N"
  exit 1
  else
  echo -e "$2:Installation is $G successful $N"
  fi
}

if [ $USERID -ne 0 ]
then
echo -e "$R ERROR:please run this script with root access $N"
exit 1
fi

for packages in $@
do
yum list installed $packages &>$LOGFILE
if [ $? -ne 0 ]
then
echo "Installing the $packages package"
yum install $packages -y &>$LOGFILE
VALIDATE $? $packages
else
echo -e "$Y $packages is already installed $N"
fi

# if rpm -q "$packages" > /dev/null
# then
# echo -e "$Y $packages is already installed $N"
# else
# echo "Installing the $packages package"
# yum install $packages -y &>>LOGFILE
# VALIDATE $? $packages
# fi
# if  [ $? -ne 0 ] 
# then
# echo "$packages: Installation is failure"
# exit 1
# else
# echo "$packages: Installation is Success"
# fi
done