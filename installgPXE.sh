#!/bin/bash
if [ -f /root/version ]; then
# Ubuntu Base Image: we will build the gPXE kernel locally
BUILD=gpxe-1.0.1-`uname -m`-built
if [ ! -d $BUILD ]; then
	tar -xzf $BUILD.tar.gz
fi
cd $BUILD/src
#Now Build
echo "Building a customized gPXE Linux kernel with the following embeded script"
cat ../../iscsi.gpxe
make EMBEDDED_IMAGE=../../iscsi.gpxe bin/gpxe.lkrn

#enable the debug mode
set -x
cp bin/gpxe.lkrn /boot
#grub-set-default gPXE # no longer working with some complaints on env block
#^ character means a line start with saved_entry=0
sed -i 's/^saved_entry=0/saved_entry=gPXE/' /boot/grub/grubenv
cd -

sync
sync
sync

echo "checking your default boot entry..."
cat /boot/grub/grubenv

else
    #We can't build from source. Get it from SRN via curl
    SRN_IP=`grep sanboot iscsi.gpxe |awk '{print $2}'|awk -F ':' '{print $2}'`
    set -x

    # -F means submit, @ means we attach iscsi.gpxe as a file
    curl -o /boot/gpxe.lkrn -F "myFile=@iscsi.gpxe" http://$SRN_IP/buildgPXE.php
    set +x 
    if [ -f /boot/grub/grub.conf ]; then
        GRUBCONFFILE=/boot/grub/grub.conf
        # This indicates RHEL-like systems
        sed -i '/hiddenmenu/c\hiddenmenu\ntitle gPXE\n\troot (hd0,0)\n\tkernel /gpxe.lkrn' $GRUBCONFFILE
        echo "checking grub loader configuration file of $GRUBCONFFILE and fix it if necessary:"
        cat $GRUBCONFFILE
    elif [ -f /boot/grub/grubenv ]; then
        #This indicates Ubuntu-like systems 
        sed -i 's/^saved_entry=0/saved_entry=gPXE/' /boot/grub/grubenv
        echo "checking your default boot entry..."
        cat /boot/grub/grubenv
    fi
fi
