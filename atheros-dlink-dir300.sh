#!/bin/sh
disabled='0'
while [ $disabled == '0' ]
do
    if [ -z $( wl_atheros assoclist )]
    then
        #echo "shutting down"
        ifconfig ath0 down
        gpio disable 2
        disabled='1'
    else
        #echo "something still connected to the radio, flashing"        
        gpio enable 3
        sleep 3
        gpio disable 3
        sleep 3
    fi;
done 
