#!/bin/sh
disabled='0'
echo timer > /sys/class/leds/tp-link\:blue\:signal5/trigger
echo timer > /sys/class/leds/tp-link\:blue\:signal4/trigger
while [ $disabled == '0' ]
do
	if [ $( arp -n | wc -l ) == 1 ]
	then
		echo none > /sys/class/leds/tp-link\:blue\:signal5/trigger
		echo none > /sys/class/leds/tp-link\:blue\:signal4/trigger
		wifi down #Shutting down radio, nothing connected
		disabled='1'
	else
		echo 2000 > /sys/class/leds/tp-link\:blue\:signal5/delay_on
		echo 2500 > /sys/class/leds/tp-link\:blue\:signal4/delay_on
		echo 1900 > /sys/class/leds/tp-link\:blue\:signal5/delay_off
		echo 2400 > /sys/class/leds/tp-link\:blue\:signal4/delay_off
	fi;
done
