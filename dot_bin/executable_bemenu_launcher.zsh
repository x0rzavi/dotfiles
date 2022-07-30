#!/usr/bin/env zsh

# Author: https://github.com/x0rzavi
# Description: Bemenu for .desktop files
# Dependencies: bemenu, Lucide font
# Theme: Catppuccin

# Variables
black='#1E1E2E'
sky='#89DCEB'
mauve='#CBA6F7' 
peach='#FAB387'
green='#A6E3A1'

ls /usr/share/applications/ \
	| grep desktop \
	| sed 's/\.desktop//' \
	| bemenu \
	--ignorecase \
	--list 5 \
	--prefix '' \
	--prompt 'LAUNCH ' \
	--fork \
	--line-height 25 \
	--cw 5 \
	--fn 'Iosevka Nerd Font' \
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
	--cf ${mauve} \
	| xargs gtk4-launch
