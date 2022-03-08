#!/usr/bin/env bash

# Description: Powermenu implemented with bmenu
# Dependencies: bemenu, libnotify, elogind
# Theme: Catppuccin

# Variables
black="#1E1E2E" 
sky="#89DCEB"
mauve="#DDB6F2" 
peach="#F8BD96"
green="#ABE9B3"
options="ﰸ Cancel\n Suspend\n Lock\n Logout\n勒 Reboot\n襤 Shutdown"
selected=$(echo -e $options \
	| bemenu \
	-p 'POWERMENU  ' -l 6 --fn 'JetBrainsMono Nerd Font Bold 11.5' \
	--tb $black \
	--tf $sky \
	--fb $black \
	--ff $mauve \
	--nb $black \
	--nf $peach \
	--hb $black \
	--hf $green)

if [[ "$selected" == *"Cancel"* ]]; then
	:
elif [[ "$selected" == *"Suspend"* ]]; then
	notify-send " Suspending in 5sec"
	sleep 5
	loginctl suspend
elif [[ "$selected" == *"Lock"* ]]; then
	swaylock.sh
elif [[ "$selected" == *"Logout"* ]]; then
	exit_sway.sh
elif [[ "$selected" == *"Shutdown"* ]]; then
	notify-send "襤 Shutting down in 5sec"
	sleep 5
	loginctl poweroff
elif [[ "$selected" == *"Reboot"* ]]; then
	notify-send "勒 Rebooting in 5sec"
	sleep 5	
	loginctl reboot
fi
