#!/bin/bash
# DATE=$(date +%F-%H:%M:%S)
# LOGFILE=
R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE() {
  if [ $1 -ne 0 ]
  then
  echo "$2:Installation is $R failure $N"
  exit 1
  else
  echo "$2:Installation is $G successful $N"
  fi
}

for packages in $@
do
yum install $packages -y
# if  [ $? -ne 0 ] 
# then
# echo "$packages: Installation is failure"
# exit 1
# else
# echo "$packages: Installation is Success"
# fi
VALIDATE $? $packages
done