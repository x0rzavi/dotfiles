#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Powermenu implemented with bemenu
# Dependencies: bemenu, libnotify, elogind
# Theme: Catppuccin

# Variables
black="#1E1E2E" 
sky="#89DCEB"
mauve="#CBA6F7" 
peach="#FAB387"
green="#A6E3A1"
options=" Cancel\n Suspend\n Lock\n Logout\n勒 Reboot\n襤 Shutdown"

selected=$(echo -e $options \
	| bemenu \
	--prefix '' \
	--prompt 'POWERMENU  ' \
	--list 6 \
	--fn 'Iosevka Nerd Font Bold 12' \
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
	notify-send --expire-time=3000 "     Suspending in 5 seconds"
	sleep 5
	loginctl suspend
elif [[ "$selected" == *"Lock"* ]]; then
	sway_lock.sh
elif [[ "$selected" == *"Logout"* ]]; then
	sway_exit.sh
elif [[ "$selected" == *"Shutdown"* ]]; then
	notify-send --expire-time=3000 "  襤   Shutting down in 5 seconds"
	sleep 5
	loginctl poweroff
elif [[ "$selected" == *"Reboot"* ]]; then
	notify-send --expire-time=3000 "  勒   Rebooting in 5 seconds"
	sleep 5	
	loginctl reboot
fi
