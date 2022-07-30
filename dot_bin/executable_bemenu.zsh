#!/usr/bin/env zsh

# Author: https://github.com/x0rzavi
# Description: Bemenu-run
# Dependencies: bemenu, Lucide icons
# Theme: Catppuccin

# Variables
black='#1E1E2E'
sky='#89DCEB'
mauve='#CBA6F7' 
peach='#FAB387'
green='#A6E3A1'

bemenu-run \
	--ignorecase \
	--list 5 \
	--prefix '' \
	--prompt 'RUN ' \
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
	--cf ${mauve}
