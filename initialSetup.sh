#!/usr/bin/env bash

#Script by misterblack0101 to install basic apps and setup for
# MSI MODERN 14 on a 
#DEBIAN BASED OS

cd ~

#UPDATE && UPGRADE
echo "Inintializing script!!"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install wget -y
echo
echo "-------------------------------------------------------------------------"
echo

# GPARTED
echo "Installing gparted now:"
echo
sudo apt-get install gparted -y
echo
echo "Gparted Installed successfullly!!"
echo
echo "-------------------------------------------------------------------------"
echo

#GITHUB
echo "Installing git now..."
echo
sudo apt-get install git -y
echo
echo
read -p "Do you want to configure git username and email? y/n:  " ans
if [ $ans = "y" ] || [ $ans = "Y" ]; 
then
read -p "Enter your username: " name
echo
read -p "Enter your email: " email
echo
git config --global user.email $email 
git config --global user.name $name 
git config --list
echo
echo "You can always change it by typing:"
echo "git config --global user.email <email_id> "
echo "git config --global user.name <name> "
echo
echo "All done!"
fi
echo
echo "Git configured successfully!!"
echo "-------------------------------------------------------------------------"
echo

#HTOP
echo "Installing htop now"
echo
sudo apt-get install htop -y
echo "Htop installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

#TLP
echo "Installing TLP now"
echo
sudo apt-get install tlp -y
sudo systemctl enable tlp.service
sudo systemctl start tlp.service
echo "TLP installed and setup successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

#JAVA, PYTHON, C, C++
echo "Installing jdk16 for java, python and c/c++ build essemtials now"
echo
sudo apt-get install openjdk-16-jre-headless -y 
sudo apt-get install openjdk-16-jdk-headless -y 
#sudo apt install python3.9 -y
sudo apt-get install build-essential -y
echo "Compilers installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

#VSCODE
echo "Installing VSCode now"
echo
wget -O vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo dpkg -i vscode.deb
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

#MEDIA PLAYERS
echo "Installing VLC and MPV now"
echo
sudo apt-get install vlc -y
sudo apt-get install mpv -y
echo "Media Players installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

#Fonts and codecs
echo "Installing fonts and codecs now"
echo
sudo add-apt-repository multiverse -y
sudo apt-get update && sudo apt-get install ttf-mscorefonts-installer -y
sudo apt-get install ubuntu-restricted-extras -y
echo "MS-TTCore fonts and multimedia codecs installed successfully!!"
echo "-------------------------------------------------------------------------"
echo

#Torrent
echo "Installing qbittorrent now"
echo
sudo apt-get install qbittorrent -y
echo "QBITTORRENT installed successfully!!"
echo "-------------------------------------------------------------------------"
echo

echo "Install discord manually"
echo
echo "Script has ended. Enjoy the setup!"

