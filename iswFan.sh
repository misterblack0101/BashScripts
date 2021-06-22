#!/usr/bin/env bash

#Script by misterblack0101 to install fan control app for
# MSI MODERN 14 on a 
#DEBIAN BASED OS

#ISW for fans
echo
read -p "Do you want to  install MSI fan Systems? y/n:  " ans
if [ $ans = "y" ] || [ $ans = "Y" ]; 
then
#----------------
flag=0
echo "Installing ISW for fans now"
echo
git clone https://github.com/YoyPa/isw
cd isw
install -Dm 644 etc/isw.conf "${pkgdir}/etc/isw.conf"
install -Dm 644 etc/modprobe.d/isw-ec_sys.conf "${pkgdir}/etc/modprobe.d/isw-ec_sys.conf"
install -Dm 644 etc/modules-load.d/isw-ec_sys.conf "${pkgdir}/etc/modules-load.d/isw-ec_sys.conf"
install -Dm 644 usr/lib/systemd/system/isw@.service "${pkgdir}/usr/lib/systemd/system/isw@.service"
install -Dm 755 isw "${pkgdir}/usr/bin/isw"
cd ~
sudo rm -rf isw
modprobe ec_sys write_support=1
echo
echo "Fans will now start, and turn off after 15 secs..."
sudo isw -b on
sleep 15
echo
echo
#---------------
else
echo "Not installing ISW fans, moving ahead"
flag=1
fi
echo "-------------------------------------------------------------------------"
echo



if [ $flag -eq 0 ];
then
sudo isw -b off
fi

