#!/bin/sh
disabled='0'
while [ $disabled == '0' ]
do
	if [ $( arp -n | wc -l ) == 1 ]
	then
		wifi down #Shutting down radio, nothing connected
	else
		echo 255 > /sys/class/leds/tp-link\:blue\:signal5/brightness
		echo 0 > /sys/class/leds/tp-link\:blue\:signal5/brightness
		echo 255 > /sys/class/leds/tp-link\:blue\:signal4/brightness
		echo 0 > /sys/class/leds/tp-link\:blue\:signal4/brightness
		sleep 1
	fi;
done
