#!/bin/bash
Max=0
echo -n "Enter a number between (5 to 9) :"
read Max
if ![$Max -ge 5 -a $Max -le 9];
then
    echo "WTF... please enter a number between 5 and 9. Try again"
    exit 1
fi
clear
