#!/bin/bash
# Author: https://github.com/x0rzavi

# Volume
volume () {
	state=$(pactl get-sink-mute @DEFAULT_SINK@ | sed -e 's/Mute: //g')
	if [[ $state = "no" ]]
	then
		printf " "
		printf "$(pactl get-sink-volume @DEFAULT_SINK@ | sed -e 's/[^%0-9 ]*//g;s/  */\n/g' | sed -n '/%/p' | sed -e 's/%//' | head -n 1)"
		printf "%%"
	else
		printf "婢 "
		printf "Muted"
	fi
}

# Brightness
brightness () {
	printf " "
	printf "$(xbacklight -get)"
	printf "%%"
}

# Battery
battery () {
	status=$(cat /sys/class/power_supply/BAT1/status)
	if [[ $status = "Discharging" ]]
	then
		printf " "
		printf "$(cat /sys/class/power_supply/BAT1/capacity)"
		printf "%%"
	else
		printf " "
		printf "$(cat /sys/class/power_supply/BAT1/capacity)"
		printf "%%"
	fi
}

# Date
clock () {
	printf " "
	printf "$(date '+%a %d %b %I:%M %p')"
}

# Memory
mem () {
	printf "﬙ "
	printf "$(free -h | awk '/^Mem/ { print $3 }' | sed s/i//g)"
}

# CPU
cpu () {
	printf " "
	printf "$(grep -o "^[^ ]*" /proc/loadavg)"
}


# Wifi
wifi () {
	state=$(iwctl station wlan0 show | grep 'State' | awk '{print $2}')
	#ping=$(ping -c 1 www.google.co.in | tail -1 | awk '{print $4}' | cut -d '/' -f 2 | cut -d '.' -f 1)
	if [[ $state = "connected" ]]
	then
		printf "直 "
		printf "$(iwctl station wlan0 show | grep 'Connected network' | awk '{print $3}')"
		#printf " ($ping)"
	else
		printf "睊 "
	fi
}

echo "$(mem) | $(cpu) | $(brightness) | $(volume) | $(wifi) | $(battery) | $(clock)"
