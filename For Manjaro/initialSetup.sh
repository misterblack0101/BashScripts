#!/usr/bin/zsh

#Script by misterblack0101 to install basic apps and setup for
# MSI MODERN 14 on
#Manjaro

cd ~

#UPDATE && UPGRADE
echo "Inintializing script!!"

echo "Updating mirrors"
pacman-mirrors -g
sudo pacman -Syy
echo
echo "-------------------------------------------------------------------------"
echo
echo "Updating system"
echo
echo "-------------------------------------------------------------------------"
echo
pamac upgrade -a
sudo pacman -Sy upgrade
sudo pacman -Sy wget
echo
echo "-------------------------------------------------------------------------"
echo

# GPARTED
echo "Installing gparted now:"
echo
sudo pacman -Sy install gparted
echo
echo "Gparted Installed successfullly!!"
echo
echo "-------------------------------------------------------------------------"
echo

#GITHUB
echo "Installing git now..."
echo
sudo pacman -Sy git
echo
echo
read -p "Do you want to configure git username and email? y/n:  " ans
if [ $ans = "y" ] || [ $ans = "Y" ]; then
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
sudo pacman -Sy htop
echo "Htop installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

# #TLP
# echo "Installing TLP now"
# echo
# sudo add-apt-repository ppa:linrunner/tlp
# pacman -Sy update
# sudo pacman -Sy install tlp tlp-rdw -y
# read -p "Do you want to enable tlp, or wait for auto-cpufreq? (Suggested ans is N) y/n:  " ans
# if [ $ans = "y" ] || [ $ans = "Y" ];
# then
# sudo systemctl enable tlp.service
# sudo systemctl start tlp.service
# fi
# echo "TLP installed and setup successfully!!"
# echo
# echo "-------------------------------------------------------------------------"
# echo

#JAVA, PYTHON, C, C++
echo "Installing jdk17 for java, python and c/c++ build essemtials now"
echo
sudo pamac install jdk
sudo pacman -Sy build-essential
echo "Compilers installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

#Flatpak
echo "Installing flatpak"
sudo pacman -Sy flatpak
echo "-------------------------------------------------------------------------"

#VSCODE
echo "Installing VSCode now"
echo
sudo pamac install code
echo "VScode installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

#CHROME
echo "Installing Google Chrome and MS-edge now"
echo
sudo pamac build google-chrome
sudo pamac build microsoft-edge-stable-bin
echo "Installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

#MEDIA PLAYERS
echo "Installing VLC and MPV now"
echo
sudo pacman -Sy vlc
sudo pacman -Sy mpv
echo "Media Players installed successfully!!"
echo
echo "-------------------------------------------------------------------------"
echo

#Fonts and codecs
echo "Installing fonts now"
echo
pamac build ttf-ms-fonts
echo "-------------------------------------------------------------------------"
echo

#Torrent
echo "Installing qbittorrent now"
echo
sudo pacman -Sy qbittorrent
echo "QBITTORRENT installed successfully!!"
echo "-------------------------------------------------------------------------"
echo

#Torrent
echo "Installing Discord now"
echo
flatpak install flathub com.discordapp.Discord
echo "Discord installed successfully!!"
echo "-------------------------------------------------------------------------"

echo "Install auto-cpufreq manually"
echo
echo "Script has ended. Enjoy the setup!"
