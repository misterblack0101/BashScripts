#!/usr/bin/bash

#Script by misterblack0101 to install basic apps and setup for
# MSI MODERN 14 on a 
#DEBIAN BASED OS

cd ~

#UPDATE && UPGRADE
echo "Inintializing script!!"
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install wget
echo
echo "-------------------------------------------------------------------------"
echo

# GPARTED
echo "Installing gparted now:"
echo
sudo apt-get install gparted
echo
echo "Gparted Installed successfullly!!"
echo
echo "-------------------------------------------------------------------------"
echo

#GITHUB
echo "Installing git now..."
echo
sudo apt-get install git
echo
echo "Setting up git global name and email"
git config --global user.email harshmarooo123@gmail.com 
git config --global user.name Harsh 
git config --list
echo
echo "Git configured successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

#HTOP
echo "Installing htop now"
echo
sudo apt-get install htop
echo "Htop installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

#TLP
echo "Installing TLP now"
echo
sudo apt-get install tlp
sudo systemctl enable tlp.service
sudo systemctl start tlp.service
echo "TLP installed and setup successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

#JAVA, PYTHON, C, C++
echo "Installing jdk16 for java, python and c/c++ build essemtials now"
echo
sudo apt-get install openjdk-16-jre-headless 
sudo apt-get install openjdk-16-jre-headless 
sudo apt-get install build-essential
echo "Compilers installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

#VSCODE
echo "Installing VSCode now"
echo
wget -O vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install ./vscode
sudo rm vscode.deb
echo "VScode installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo


#CHROME
echo "Installing Google Chrome now"
echo
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm google-chrome-stable_current_amd64.deb
echo "Google Chrome installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

#CHROMIUM browser
#echo "Installing Chromium now"
#echo
#sudo apt-get install chromium-browser
#echo "Chromium Browser installed successfully!!"
#echo
#echo "-------------------------------------------------------------------------"
#echo

#MEDIA PLAYERS
echo "Installing VLC and MPV now"
echo
sudo apt-get install vlc
sudo apt-get install mpv
echo "Media Players installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

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
echo "Fans will now start, and turn off after the next task finishes"
sudo isw -b on
echo
#---------------
else
echo "Not installing ISW fans, moving ahead"
flag=1
fi
echo "-------------------------------------------------------------------------"
echo

#Fonts and codecs
echo "Installing fonts and codecs now"
echo
sudo add-apt-repository multiverse
sudo apt-get update && sudo apt-get install ttf-mscorefonts-installer
sudo apt-get install ubuntu-restricted-extras
echo "MS-TTCore fonts and multimedia codecs installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

if [ $flag -eq 0 ];
then
sudo isw -b off
fi

echo "Install discord manually"
echo
echo "Script has ended. Enjoy the setup!"
