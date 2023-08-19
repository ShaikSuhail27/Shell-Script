#!/bin/bash

#to check whether the string is palindrome or not

echo "enter the string :"

read STRING

REV_STRING=$(echo $STRING | rev)

echo $REV_STRING