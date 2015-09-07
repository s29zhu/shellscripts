#!/bin/bash

# direct good result to File and error code to ErrorFile
printf "%s%v" OK Error >> File 2> ErrorFile
# direct good result to File and discard the error message 
printf "%s%v" OK Error >> File 2> /dev/null
printf "%s\n" OK >> File
