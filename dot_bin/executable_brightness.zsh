#!/usr/bin/env zsh

# Author: https://github.com/x0rzavi
# Description: Brightness manipulation
# Dependencies: acpilight, getopt (enhanced), Lucide fonts

# Variables
step=3
fps=150

show_help () {
	cat <<EOF
Usage: brightness.zsh [option] [argument]

Available options:
    -g | --get              get current brightness
    -i | --inc              increase current brightness by +${step}
    -d | --dec              decrease current brightness by -${step}
    -s | --set [arg]        set brightness to [arg]
EOF
}

get_brightness () {
	brightness=$(xbacklight -get)
	echo "${brightness}%"
}

inc_brightness () {
	xbacklight -fps ${fps} +${step}
	get_brightness
}

dec_brightness () {
	xbacklight -fps ${fps} -${step}
	get_brightness
}

set_brightness () {
	xbacklight -fps ${fps} "$1"
	get_brightness
}

TEMP=$(getopt --options 'gids:' --longoptions 'get,inc,dec,set:' --name 'brightness.zsh' -- "$@" )
if [[ $? -ne 0 ]]; then
	show_help
	exit 1
fi
eval set -- "${TEMP}"
unset TEMP

case "$1" in
	('-g'|'--get')
		get_brightness
		;;
	('-i'|'--inc')
		inc_brightness
		;;
	('-d'|'--dec')
		dec_brightness
		;;
	('-s'|'--set')
		set_brightness "$2"
		;;
	(*)
		show_help
		;;
esac