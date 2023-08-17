#!/bin/bash

VALIDATE() {
  if [ $1 -ne 0 ]
  then
  echo "$2:Installation is failure"
  else
  echo "$2:Installation is successful"
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