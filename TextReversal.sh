#!/bin/bash

# to reverse the order of characters in each line of a text file

Input_file=/home/centos/suhail_input.txt
Output_file=/home/centos/suhail_output.txt

while read -r line;
do 
reverse=$(echo $line | rev)
echo "$reverse" >> "$Output_file"
done < "$Input_file"
echo "Reversal complete and modified line copied to $Output_file"