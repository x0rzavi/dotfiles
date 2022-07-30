#!/usr/bin/env zsh

# Author: https://github.com/x0rzavi
# Description: Powermenu implemented with bemenu
# Dependencies: sway, bemenu, libnotify, elogind, getopt (enhanced), Lucide icons
# Theme: Catppuccin

# Variables
black='#1E1E2E'
sky='#89DCEB'
mauve='#CBA6F7' 
peach='#FAB387'
green='#A6E3A1'
option=' Cancel\n Suspend\n Lock\n Logout\n Reboot\n Shutdown'

selected=$(echo -e ${option} \
	| bemenu \
	--ignorecase \
	--list 6 \
	--prefix '' \
	--prompt 'POWERMENU ' \
	--fork \
	--line-height 25 \
	--cw 5 \
	--fn 'Iosevka Nerd Font Bold' \
	--tb ${black} \
	--tf ${peach} \
	--fb ${black} \
	--ff ${mauve} \
	--nb ${black} \
	--nf ${peach} \
	--hb ${black} \
	--hf ${green} \
	--ab ${black} \
	--af ${sky} \
	--bdr ${mauve} \
	--cb ${black} \
	--cf ${mauve})

if [[ $selected = *'Cancel'* ]]; then
	:
elif [[ $selected = *'Suspend'* ]]; then
	notify-send --expire-time=3000 " Suspending in 5 seconds..." && \
	sleep 5 && \
	sway_lock.sh && \
	sleep 1 && \
	loginctl suspend
elif [[ $selected = *'Lock'* ]]; then
	sway_lock.sh
elif [[ $selected = *'Logout'* ]]; then
	sway_exit.sh
elif [[ $selected = *'Shutdown'* ]]; then
	notify-send --expire-time=3000 " Shutting down in 5 seconds..." && \
	sleep 5 && \
	loginctl poweroff
elif [[ $selected = *'Reboot'* ]]; then
	notify-send --expire-time=3000 " Rebooting in 5 seconds..." && \
	sleep 5	&& \
	loginctl reboot
fi
