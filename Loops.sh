#!/bin/bash

for packages in $@
do
yum install $packages -y
if [$? -ne 0] 
then
echo "$packages: Installation is failure"
else
echo "$packages: Installation is Success"
done