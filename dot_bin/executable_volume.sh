#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Easy volume manipulator
# Dependencies: pulseaudio, Lucide icons

# Variables
step='2'

get_icon () {
	if [ "${volume}" -eq '0' ] || [ "${state}" = 'yes' ]
	then icon=''
	elif [ "${volume}" -ge '0' ] && [ "${volume}" -lt '55' ]
	then icon=''
	elif [ "${volume}" -ge '55' ]
	then icon=''
	fi
}

get_volume () {
	volume=$(pactl get-sink-volume @DEFAULT_SINK@ | sed -e 's/[^%0-9 ]*//g;s/  */\n/g' | sed -n '/%/p' | sed -e 's/%//' | head -n 1)
	state=$(pactl get-sink-mute @DEFAULT_SINK@ | sed -e 's/Mute: //g')
	get_icon
	if [ "${state}" = 'no' ]
	then printf '%s  %s%%\n' "${icon}" "${volume}"
	else printf '%s  Muted\n' "${icon}"
	fi
}

inc_volume () {
	pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ +"${step}"%
	get_volume
}

dec_volume () {
	pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ -"${step}"%
	get_volume
}

toggle_volume () {
	pactl set-sink-mute @DEFAULT_SINK@ toggle
	get_volume
}

mute_volume () {
	pactl set-sink-mute @DEFAULT_SINK@ 1
	get_volume
}

set_volume () {
	pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ "$1"%
	get_volume
}

show_help () {
	cat <<- EOF
	Usage: volume.sh [option] [argument]

	Available options:
	-g          get current volume
	-i          increase current volume by +${step}
	-d          decrease current volume by -${step}
	-t          toggle current volume state
	-m          mute volume device
	-s (arg)    set volume to (arg)
	EOF
}

getopts gidtms: opt
case ${opt} in
	(g) get_volume;;
	(i) inc_volume;;
	(d) dec_volume;;
	(t) toggle_volume;;
	(m) mute_volume;;
	(s) set_volume "${OPTARG}";;
	(\?) show_help;;
esac