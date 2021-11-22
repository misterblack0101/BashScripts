echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "This is for bash shell only. For any other shell, please set aliases manually."
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

read -p "Do you want to set alias for controlling your fans? y/n:  " ans
if [ $ans = "y" ] || [ $ans = "Y" ]; 
then
#----------------
cd
echo "alias fan=\"sudo isw -b on\"" >> .bashrc
echo "alias fanoff=\"sudo isw -b off\"" >> .bashrc
echo
echo "You can turn on/off the fans by using fan and fanoff respectively."
echo "Restart your shell to see the changes."

#---------------
else
echo "Not setting aliases. Have a good day!"
fi