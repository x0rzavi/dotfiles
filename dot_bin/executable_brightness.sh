#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Brightness manipulation
# Dependencies: acpilight

get_brightness () {
	brightness="$(xbacklight -get)"
	echo " $brightness%"
}

inc_brightness () {
	xbacklight +3
	get_brightness
}

dec_brightness () {
	xbacklight -3
	get_brightness
}

show_help () {
	cat <<EOF
Usage: brightness.sh [options]

AVAILABLE OPTIONS:
  --get         get current brightness
  --set 	set brightness to ?
  --inc         increase current brightness by +3
  --dec         decrease current brightness by -3
EOF
}

if [[ "$1" == "--get" ]]; then
	get_brightness
elif [[ "$1" == "--inc" ]]; then
	inc_brightness
elif [[ "$1" == "--dec" ]]; then
	dec_brightness
elif [[ "$1" == "--set" ]]; then
	xbacklight "$2"
else
	show_help
fi
