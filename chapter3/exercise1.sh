#!/bin/bash

while true
do 
	printf "%s\n" "Please enter a number between 20 and 30:"
	read number
	case number in
		 *[!0-9]*) continue;;
 	esac
	printf "%s\n" "pass the first stage"
 	[[ $number < 20 || $number > 30 ]] || break
done
		
  
