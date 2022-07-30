#!/usr/bin/env zsh

# Author: https://github.com/x0rzavi
# Description: Basic bar info generator
# Dependencies: Lucide font

# Volume Icon
volume_icon () {
	if [[ (( $volume -eq '0' )) || (( $state = 'yes' )) ]]; then
		icon=''
	elif [[ (( $volume -ge '0' )) && (( $volume -lt '55' )) ]]; then
		icon=''
	elif [[ (( $volume -ge '55' )) ]]; then
		icon=''
	fi
}

# Volume
volume () {
	volume=$(pactl get-sink-volume @DEFAULT_SINK@ | sed -e 's/[^%0-9 ]*//g;s/  */\n/g' | sed -n '/%/p' | sed -e 's/%//' | head -n 1)
	state=$(pactl get-sink-mute @DEFAULT_SINK@ | sed -e 's/Mute: //g')
	volume_icon
	if [[ ${state} = 'no' ]]; then
		printf "${icon}  ${volume}%%"
	else
		printf "${icon}  Muted"
	fi
}

# Brightness icon
brightness_icon () {
	if [[ (( $brightness -ge '0' )) && (( $brightness -lt '30' )) ]]; then
		icon=''
	elif [[ (( $brightness -ge '30' )) && (( $brightness -lt '60' )) ]]; then
		icon=''
	elif [[ (( $brightness -ge '60' )) ]]; then
		icon=''
	fi
}

# Brightness
brightness () {
	brightness=$(xbacklight -get)
	brightness_icon
	printf "${icon}  ${brightness}%%"
}

# Battery icon
battery_icon () {
	if [[ $bat_status = "Discharging" ]]; then
		if [[ (( $bat_capacity -ge '0' )) && (( $bat_capacity -le '25' )) ]]; then
			icon=''
		elif [[ (( $bat_capacity -ge '25' )) && (( $bat_capacity -le '50' )) ]]; then
			icon=''
		elif [[ (( $bat_capacity -ge '50' )) && (( $bat_capacity -le '75' )) ]]; then
			icon=''
		elif [[ (( $bat_capacity -ge '75' )) ]]; then
			icon=''
		fi
	else
		icon=''
	fi
}

# Battery
battery () {
	bat_status=$(cat /sys/class/power_supply/BAT1/status)
	bat_capacity=$(cat /sys/class/power_supply/BAT1/capacity)
	battery_icon
	printf "${icon}  ${bat_capacity}%%"
}

# Date
clock () {
	printf '  '
	printf "$(date '+%I:%M %p  %A %d %b')"
}

# Memory
memory () {
	printf '  '
	printf "$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

# CPU
cpu () {
	printf '  '
	printf "$(grep -o "^[^ ]*" /proc/loadavg)"
}

# Wifi
wifi () {
	#ping=$(ping -c 1 www.google.co.in | tail -1 | awk '{print $4}' | cut -d '/' -f 2 | cut -d '.' -f 1)
	wifi_state=$(iwctl station wlan0 show | grep 'State' | awk '{print $2}')
	if [[ $wifi_state = 'connected' ]]; then
		printf '  '
		printf "$(iwctl station wlan0 show | grep 'Connected network' | awk '{print $3}')"
	else
		printf '  '
		printf 'Disconnected'
	fi
}

echo "$(memory) | $(cpu) | $(clock) | $(wifi) | $(volume) | $(brightness) | $(battery)"