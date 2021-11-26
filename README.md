# BashScripts
My personal collection of bash scripts

## Initial Setup
The initialSetup.sh file installs the apps I regularly use. 
If some app is not wanted, just delete the lines from "Installing xyz app" to the next "Installing .. app" statement. 

Ex. If you don't want gparted, the just remove this:  
```bash
echo "Installing gparted now:"  
echo  
sudo apt-get install gparted -y  
echo  
echo "Gparted Installed successfullly!!"  
echo  
echo "-------------------------------------------------------------------------"  
echo
```  

## isw Fan
This script is for MSI  laptops, to make the fans work. 
This script is just an installer for https://github.com/YoyPa/isw, and manual installation can be performed from the readme present in that repository. 
After running the script, if you can see the fans running for 15 seconds, that means that the script is working.  
I'd suggest adding aliases like:  
```bash
alias fan="sudo isw -b on" 
alias fanoff="sudo isw -b off"  
```
in your shell, using your shell's config file, like _.bashrc_ or _.zshrc_.

## fanAutomator
This script will automate turning MSI Cooler boost on/off for fans.
Just download the script, set the necessary values, and set the script to run at startup via Startup Applications.
**Make Sure you have ISW installed beforehand. you can use the iswFan script, or go to https://github.com/YoyPa/isw, and installl it.**

Necessary Values:

1. `SLEEP_TIME` This parameter is the **time interval in seconds** in which the script will check for the tempereatures, and decide whether to turn on the fan or not.
2. `MAX_TEMP` This is the temperature at which the fans are supposed to start.
3. `TURN_OFF_FAN` This is the temperatures at which the fans will turn off. 
**NOTE:** I'd advise to set this to atleast 5-6 degrees less than the fan turn on value, so that the fans are not continuously going on and off.

This Script is tried and tested on MSI Modern 14, with POP OS and Linux Mint. 
**I am NOT responsible for any damage done by this script.** 
Please, read the code, and if you feel it's right, use it. 
Any suggestions are welcome.