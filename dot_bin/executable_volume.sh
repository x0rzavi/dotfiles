#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Volume manipulation
# Dependencies: pulseaudio

get_icon () {
	if [[ "$volume" -eq "0" ]]; then
		icon='婢'
	elif [[ ("$volume" -ge "0") && ("$volume" -le "30") ]]; then
		icon='奄'
	elif [[ ("$volume" -ge "30") && ("$volume" -le "60") ]]; then
		icon=''
	elif [[ ("$volume" -ge "60") && ("$volume" -le "100") ]]; then
		icon=''
	fi
}

get_mute_state () {
	state=$(pactl get-sink-mute @DEFAULT_SINK@ | sed -e 's/Mute: //g')
}

get_volume () {
	volume="$(pactl get-sink-volume @DEFAULT_SINK@ | sed -e 's/[^%0-9 ]*//g;s/  */\n/g' | sed -n '/%/p' | sed -e 's/%//' | head -n 1)"
	get_mute_state
	if [[ $state = "no" ]]
	then
		get_icon
		echo "$icon" "$volume%"
	else
		echo "婢Muted"
	fi
}

inc_volume () {
	pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ +2%
	get_volume
}

dec_volume () {
	pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ -2%
	get_volume
}

toggle_volume () {
	pactl set-sink-mute @DEFAULT_SINK@ toggle
	get_volume
}

mute_volume () {
	pactl set-sink-mute @DEFAULT_SINK@ 1
	echo "婢Muted"
}

show_help () {
    cat <<EOF
Usage: volume.sh [options]

AVAILABLE OPTIONS:
  --get         get current volume
  --inc         increase current volume by +2
  --dec         decrease current volume by -2
  --toggle      toggle speaker state
  --mute        mute speaker
EOF
}

if [[ "$1" == "--get" ]]; then
	get_volume
elif [[ "$1" == "--inc" ]]; then
	inc_volume
elif [[ "$1" == "--dec" ]]; then
	dec_volume
elif [[ "$1" == "--toggle" ]]; then
	toggle_volume
elif [[ "$1" == "--mute" ]]; then
	mute_volume
else
	show_help
fi
