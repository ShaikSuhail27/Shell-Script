#!/bin/bash

# To replace the old word with new word

Input_file=/home/centos/suhail_input.txt
old-text="SUHAIL"
new-text="suhail"

sed -i "s/$old-text/$new-text/g" "$Input_file"
echo "Replacement complete"