#!/usr/bin/bash

echo
read -p "Do you want to  install MSI fan Systems? y/n:  " ans
if [ $ans = "y" ] || [ $ans = "Y" ]; 
then
echo "True condition"
flag=0
else
echo "false condition"
flag=1
fi

if [ $flag -eq 0 ];
then
echo "Turn fan off manually"
fi
