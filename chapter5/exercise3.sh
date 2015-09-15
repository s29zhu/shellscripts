#!/bin/bash

var=192.168.0.123

temp=${var#*.}
printf "1.Temp is %s\n" "$temp"

temp=${temp%%.*}

printf "2. Temp is %s\n" "$temp"

