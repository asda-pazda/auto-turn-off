#!/bin/sh
disabled='1'
echo timer > /sys/class/leds/tp-link\:blue\:signal5/trigger
echo timer > /sys/class/leds/tp-link\:blue\:signal4/trigger
while [ $disabled == '1' ]
do
	if [ -z $( iw dev wlan0 station dump )]
	then
		echo none > /sys/class/leds/tp-link\:blue\:signal5/trigger
		echo none > /sys/class/leds/tp-link\:blue\:signal4/trigger
		wifi down #Shutting down radio, nothing connected
		disabled='0'
	else
		echo 2000 > /sys/class/leds/tp-link\:blue\:signal5/delay_on
		echo 2500 > /sys/class/leds/tp-link\:blue\:signal4/delay_on
		echo 1900 > /sys/class/leds/tp-link\:blue\:signal5/delay_off
		echo 2400 > /sys/class/leds/tp-link\:blue\:signal4/delay_off
		sleep 10
	fi;
done
