#!/usr/bin/bash

echo
read -p "Do you want to configure git username and email? y/n:  " ans
if [ $ans = "y" ] || [ $ans = "Y" ]; 
then
read -p "Enter your username: " name
echo
read -p "Enter your email: " email
echo
echo "You can always change it by typing:"
echo "git config --global user.email <email_id> "
echo "git config --global user.name <name> "
echo
echo "All done!"
fi


