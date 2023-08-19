#!/bin/bash

# To replace the old word with new word

Input_file=/home/centos/suhail_input.txt
Find=$1
Replace=$2

Replace=$(sed -i "s/$Find/$Replace/g" "$Input_file")
echo "Replacement complete"