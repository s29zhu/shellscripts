#!/bin/bash

# direct standard output to File and standard error code to ErrorFile
#printf "%s%v" OK Error > File 2> ErrorFile
# direct standard output to File and discard the standard error 
#printf "%s%v" OK Error > File 2>/dev/null
# direct fine result and Error to the standard output stream which is
# redirected to File before, so the error will go to File as well
printf "%s%v\n" OK Error > File 2>&1
printf "%s\n%v" OK Error > File 2>&1
printf "%s%v"  OK Error 2>&1 > File
#exec command to redirect to the I/O streams for the rest of the script
exec 1>standoutFile
exec 0<inputFile
exec 2>errorFile
