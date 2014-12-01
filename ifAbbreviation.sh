#!/bin/bash

if [-f file]; 
  then 
    echo "file exist!"
fi
# the upper lines could be abbreviated to the following 
[-f file]  && echo "file exist!"
