#!/bin/bash

# To replace the old word with new word

Input_file=/home/centos/suhail_input.txt
old-text="SUHAIL"
new-text="suhail"

while read -r line
do
Replace="$(sed -i 's/"$old-text"/"$new-text"/g')"
done < $Input_file