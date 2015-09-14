#!/bin/bash

progname=${0##*/}

##default values
verbose=0
filename=

options=f:v

while getopts $options opt
do
	case $opt in
	f) filename=$OPTARG ;;
	v) verbose=$(( $verbose+ 1 ));;
	*) exit 1;;
	esac
done

shift "$(( $OPTIND - 1 ))"

if [ -n $"filename" ]
then
	if [ $verbose > 0 ]
	then
		printf  "The filename is %s.\n" "$filename"
	fi
else
	if [ $verbose > 0 ]
	then 
		printf "There is filename entered"
	fi
	exit 1
fi

if [ -f "$filename" ]
then 
	if [ $verbose > 0 ]
	then
		printf "Filename %s exist!\n" "$filename"
	fi
else
	if [ $verbose > 0 ]
	then
		printf "Filename %s doesn't exist!\n" "$filename"
	fi
	exit 2
fi

if [ $verbose > 0 ]
then 
	printf "Number of arguments is %d.\n" "$#"
fi
 
