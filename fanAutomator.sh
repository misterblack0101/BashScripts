#!/usr/bin/env bash

# This is a script that will automatically start/stop the fan according to the cpu temperatures.
########### YOU NEED TO HAVE ISW INSTALLED. USE ISWFAN.SH FIRST!##########

another_instance()
{
echo “There is another instance of fanAutomator running, exiting”
exit 
}
( 
flock -n 100 || another_instance 

# Interval (in seconds) to check temperatures in:
SLEEP_TIME=10

# Max temperature after which fans should start:
MAX_TEMP=56

#Temperature when to turn fans off:
TURN_OFF_FAN=$MAX_TEMP-10

#We're making sure fan is off by default.
sudo isw -b off
FAN_STATUS=0

# echo "Sleep time is $SLEEP_TIME Seconds"
# echo "Temperature for fan to turn on is $MAX_TEMP degree Celsius"
# echo "Setting the fan's state to $FAN_STATUS"

# Start loop
while :; do

    # What's the current temperature?
    TEMP=$(sensors | grep 'Package' | cut -c17-18)

    # echo "Current temp = $TEMP"
    # echo "Currently the fans state is $FAN_STATUS"
    # If fan is off, and the cpu is cool, nothing needs to be done.
    if [[ $TEMP -lt $MAX_TEMP && $FAN_STATUS -eq 0 ]] 
    then
        sleep "$SLEEP_TIME"
        continue
    # If fan is on, and temp is < max_temp-someValue, it means that the system has cooled enough, so we turn off the fans.
    elif [[ $FAN_STATUS -eq 1 && $TEMP -lt $TURN_OFF_FAN ]]
    then
        sudo isw -b off
        FAN_STATUS=0
    #If fan is off, and the temp has risen over max_temp, the we turn on the fans.
    elif [[ $TEMP -gt $MAX_TEMP && $FAN_STATUS -eq 0 ]]
    then
        sudo isw -b on
        FAN_STATUS=1
    fi
    sleep "$SLEEP_TIME"
done

) 100>/var/lock/fanAutomatorCustom.lock