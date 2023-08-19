#!/bin/bash

echo "Enter the number : "
read NUMBER
REV_NUM=$(echo $NUMBER | rev)
if [ $NUMBER -eq $REV_NUM ];
then
echo "$NUMBER is palindrome"
else
echo "$NUMBER is not a palindrome"
fi
