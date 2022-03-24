#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
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
	--prefix '' \
	--prompt 'POWERMENU  ' \
	--list 6 \
	--fn 'JetBrainsMono Nerd Font Bold 11.5' \
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
	notify-send "     Suspending in 5 seconds"
	sleep 5
	loginctl suspend
elif [[ "$selected" == *"Lock"* ]]; then
	sway_lock.sh
elif [[ "$selected" == *"Logout"* ]]; then
	sway_exit.sh
elif [[ "$selected" == *"Shutdown"* ]]; then
	notify-send "  襤   Shutting down in 5 seconds"
	sleep 5
	loginctl poweroff
elif [[ "$selected" == *"Reboot"* ]]; then
	notify-send "  勒   Rebooting in 5 seconds"
	sleep 5	
	loginctl reboot
fi
