#!/bin/bash

# To replace the old word with new word

Input_file=/home/centos/suhail_input.txt
old-text="suhail"
new-text="SUHAIL"

while read -r line
do
Replace=$(sed -i 's/old-text/new-text/g' $Input_file)
done < $Input_file