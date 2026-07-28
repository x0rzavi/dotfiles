#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Powermenu with bemenu
# Dependencies: sway, bemenu, libnotify, elogind, Lucide icons
# Theme: Catppuccin

# Variables
black='#1E1E2E'
sky='#89DCEB'
mauve='#CBA6F7' 
peach='#FAB387'
green='#A6E3A1'
options=' Cancel\n Suspend\n Lock\n Logout\n Reboot\n Shutdown'

selected=$(printf '%b' "${options}" \
	| bemenu \
	--ignorecase \
	--list 6 \
	--prefix '' \
	--prompt 'POWERMENU ' \
	--fork \
	--line-height 25 \
	--cw 3 \
	--fn 'Iosevka Nerd Font Bold' \
	--tb "${black}" \
	--tf "${peach}" \
	--fb "${black}" \
	--ff "${mauve}" \
	--nb "${black}" \
	--nf "${peach}" \
	--hb "${black}" \
	--hf "${green}" \
	--ab "${black}" \
	--af "${sky}" \
	--bdr "${mauve}" \
	--cb "${black}" \
	--cf "${mauve}" )

case "${selected}" in
	(*Cancel*) :;;
	(*Suspend*) 
		notify-send --expire-time=3000 " Suspending in 5 seconds..." && \
		sleep 5 && \
		sway_lock.sh && \
		sleep 1 && \
		loginctl suspend;;
	(*Lock*) sway_lock.sh;;
	(*Logout*) sway_exit.sh;;
	(*Shutdown*) 
		notify-send --expire-time=3000 " Shutting down in 5 seconds..." && \
		sleep 5 && \
		loginctl poweroff;;
	(*Reboot*)
		notify-send --expire-time=3000 " Rebooting in 5 seconds..." && \
		sleep 5	&& \
		loginctl reboot;;
esac