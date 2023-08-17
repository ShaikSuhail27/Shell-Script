#!/bin/bash

for packages in $@
do
yum install $packages -y
done