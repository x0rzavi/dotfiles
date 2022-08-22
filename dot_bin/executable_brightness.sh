#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Easy brightness manipulator
# Dependencies: acpilight, Lucide icons

# Variables
step='8'
fps='100'

get_icon () {
	if [ "${brightness}" -ge '0' ] && [ "${brightness}" -lt '30' ]
	then icon=''
	elif [ "${brightness}" -ge '30' ] && [ "${brightness}" -lt '60' ]
	then icon=''
	elif [ "${brightness}" -ge '60' ]
	then icon=''
	fi
}

get_brightness () {
	brightness=$(xbacklight -get)
	get_icon
	printf '%s  %s%%\n' "${icon}" "${brightness}"
}

inc_brightness () {
	xbacklight -fps "${fps}" +"${step}"
	get_brightness
}

dec_brightness () {
	xbacklight -fps "${fps}" -"${step}"
	get_brightness
}

set_brightness () {
	xbacklight -fps "${fps}" "$1"
	get_brightness
}

show_help () {
	cat<<- EOF
	Usage: brightness.sh [option] [argument]

	Available options:
	-g           get current brightness
	-i           increase current brightness by +${step}
	-d           decrease current brightness by -${step}
	-s (arg)     set brightness to (arg)
	EOF
}

getopts gids: opt
case ${opt} in
	(g) get_brightness;;
	(i) inc_brightness;;
	(d) dec_brightness;;
	(s) set_brightness "${OPTARG}";;
	(\?) show_help;;
esac
