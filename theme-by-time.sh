#!/bin/dash

#link to original post
# https://forums.linuxmint.com/viewtopic.php?p=1674417#p1674417



# Kill if already running
if pidof -o %PPID -x "${0##*/}"; then
  exit 1
fi
# Start loop
while :
do
# What time is it?
  CURRENT_TIME=$(date +%H%M)
  if [ -n "$NEXT_TIME" ] && [ "$CURRENT_TIME" -lt "$NEXT_TIME" ]; then
    sleep 120
    continue
  fi
# Depending on time set THEME_CHOICE & NEXT_TIME
  if [ "$CURRENT_TIME" -ge 0000 ] && [ "$CURRENT_TIME" -lt 0700 ]; then
    THEME_CHOICE=vimix-dark-laptop-doder
    NEXT_TIME=0700
  elif [ "$CURRENT_TIME" -ge 0700 ] && [ "$CURRENT_TIME" -lt 1800 ]; then
    THEME_CHOICE=vimix-light-laptop-doder
    NEXT_TIME=1800
  elif [ "$CURRENT_TIME" -ge 1800 ] && [ "$CURRENT_TIME" -le 2359 ]; then
    THEME_CHOICE=vimix-dark-laptop-doder
    NEXT_TIME=0000
  fi
# Set the chosen theme
  gsettings set org.cinnamon.desktop.interface gtk-theme "$THEME_CHOICE"
#  gsettings set org.cinnamon.desktop.interface icon-theme "$THEME_CHOICE"
  gsettings set org.cinnamon.theme name "$THEME_CHOICE"
# Sleep
  sleep 120
done
