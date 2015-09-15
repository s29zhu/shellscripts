#!/bin/bash

preIP="192.168.9."
vmIP="58 59 60 61 62 63 64 65 66 72"
driver="/root/driver.exe0"

for ip in $vmIP
do
    IP=$preIP$ip
    printf "The current ip is %s.\n" "$IP"
    mount -t cifs -o "username=Administrator,password=P@55W0Rd" //$IP/C$ /mnt/    
    cp $driver /mnt/driver.exe
    umount /mnt
done
