#!/bin/bash

#to check whether the string is palindrome or not

echo "enter the string :"

read STRING

REV_STRING=$(echo $STRING | rev)

if [ "$STRING" = "$REV_STRING" ] ;
then
echo "It is a palindrome"
else
echo "It is not a palindrome"
fi

#echo $REV_STRING