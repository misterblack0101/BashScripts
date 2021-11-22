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
After running the script, if you can see the fans running for 15 seconds, that means that the alias is working.  
I'd suggest adding aliases like:  
```bash
alias fan="sudo isw -b on" 
alias fanoff="sudo isw -b off"  
```
in your shell, using your shell's config file, like _.bashrc_ or _.zshrc_.
