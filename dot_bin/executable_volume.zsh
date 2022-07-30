#!/usr/bin/env zsh

# Author: https://github.com/x0rzavi
# Description: Volume manipulation
# Dependencies: pulseaudio, getopt (enhanced), Lucide fonts

# Variables
step=2

get_icon () {
	if [[ (( $volume -eq '0' )) || (( $state = 'yes' )) ]]; then
		icon=''
	elif [[ (( $volume -ge '0' )) && (( $volume -le '55' )) ]]; then
		icon=''
	elif [[ (( $volume -ge '55' )) ]]; then
		icon=''
	fi
}

get_volume () {
	volume=$(pactl get-sink-volume @DEFAULT_SINK@ | sed -e 's/[^%0-9 ]*//g;s/  */\n/g' | sed -n '/%/p' | sed -e 's/%//' | head -n 1)
	state=$(pactl get-sink-mute @DEFAULT_SINK@ | sed -e 's/Mute: //g')
	get_icon
	if [[ ${state} = 'no' ]]; then
		echo "${icon}  ${volume}%"
	else
		echo "${icon}  Muted"
	fi
}

inc_volume () {
	pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ +${step}%
	get_volume
}

dec_volume () {
	pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ -${step}%
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
	cat <<EOF
Usage volume.zsh [option] [argument]

Available options:
    -g | --get			get current volume
    -i | --inc 			increase current volume by +${step}
    -d | --dec 			decrease current volume by -${step}
    -t | --toggle 		toggle speaker state
    -m | --mute 		mute speaker
    -s | --set [arg] 		set current volume to [arg]
EOF
}

TEMP=$(getopt --options 'gidtms:' --longoptions 'get,inc,dec,toggle,mute,set:' --name 'volume.zsh' -- "$@" )
if [[ $? -ne 0 ]]; then
	show_help
	exit 1
fi
eval set -- "${TEMP}"
unset TEMP

case "$1" in
	('-g'|'--get')
		get_volume
		;;
	('-i'|'--inc')
		inc_volume
		;;
	('-d'|'--dec')
		dec_volume
		;;
	('-t'|'--toggle')
		toggle_volume
		;;
	('-m'|'--mute')
		mute_volume
		;;
	('-s'|'--set')
		set_volume "$2"
		;;
	(*)
		show_help
		;;
esac