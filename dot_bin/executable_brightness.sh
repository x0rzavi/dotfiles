#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Brightness manipulation
# Dependencies: acpilight

get_brightness () {
	brightness="$(xbacklight -get)"
	echo " $brightness%"
}

inc_brightness () {
	xbacklight +4
	get_brightness
}

dec_brightness () {
	xbacklight -4
	get_brightness
}

if [[ "$1" == "--get" ]]; then
	get_brightness
elif [[ "$1" == "--inc" ]]; then
	inc_brightness
elif [[ "$1" == "--dec" ]]; then
	dec_brightness
else
	get_brightness
fi
