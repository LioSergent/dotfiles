#!/bin/bash

file_path="/sys/devices/platform/asus-nb-wmi/leds/asus::kbd_backlight/brightness"

brightness=`cat $file_path`

if [ $brightness = '0' ]
then
	echo 3 | sudo tee $file_path
else
	echo 0 | sudo tee $file_path
fi

