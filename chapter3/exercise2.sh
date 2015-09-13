#!/bin/bash

while true
do 
printf "%s\n" "Please enter an existing file name:"
read filename
if [[ -z $filename ]]
then
	continue
fi

if [[ -f $filename || -d $filename || -h $filename ]]
then 
	break
fi
done
