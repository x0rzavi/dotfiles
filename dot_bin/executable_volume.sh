#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Easy volume manipulator
# Dependencies: wireplumber, bc, Lucide icons

# Variables
step='2'

get_icon () {
	if [ "${volume_per}" -eq '0' ] || [ "${state}" = 'yes' ]
	then icon=''
	elif [ "${volume_per}" -ge '0' ] && [ "${volume_per}" -lt '55' ]
	then icon=''
	elif [ "${volume_per}" -ge '55' ]
	then icon=''
	fi
}

get_state () {
	if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q MUTED
	then printf '%s' 'yes'
	else printf '%s' 'no'
	fi
}

get_volume () {
	volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | cut -d ' ' -f 2)
	volume_per=$(echo "${volume}"*100 / 1 | bc)
	state=$(get_state)
	# get_icon
	if [ "${state}" = 'no' ]
	then printf '%s  %s%%\n' "${icon}" "${volume_per}"
	else printf '%s  Muted\n' "${icon}"
	fi
}

inc_volume () {
	wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ "${step}"%+
	get_volume
}

dec_volume () {
	wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ "${step}"%-
	get_volume
}

toggle_volume () {
	wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
	get_volume
}

mute_volume () {
	wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
	get_volume
}

set_volume () {
	pactl set-sink-mute @DEFAULT_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ "$1"%
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