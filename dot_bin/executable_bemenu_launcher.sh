#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Bemenu for .desktop files
# Dependencies: bemenu
# Theme: Catppuccin

# Variables
black="#1E1E2E" 
sky="#89DCEB"
mauve="#CBA6F7" 
peach="#FAB387"
green="#A6E3A1"

ls /usr/share/applications/ \
	| grep desktop \
	| sed 's/.desktop//' \
	| bemenu \
	--prefix '' \
	--prompt 'LAUNCH  ' \
	--list 5 \
	--fn 'Iosevka Nerd Font Bold 12' \
	--tb $black \
	--tf $sky \
	--fb $black \
	--ff $mauve \
	--nb $black \
	--nf $peach \
	--hb $black \
	--hf $green \
	| xargs gtk4-launch
