#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Clipmenu invoker with bemenu
# Dependencies: bemenu, clipmenu
# Theme: Catppuccin

# Variables
black="#1E1E2E" 
sky="#89DCEB"
mauve="#DDB6F2" 
peach="#F8BD96"
green="#ABE9B3"

clipman pick \
	--tool bemenu \
	-T "
	--prefix '' \
	--prompt 'COPY  ' \
	--wrap \
	--list 5 \
	--fn 'JetBrainsMono Nerd Font Bold 11.5' \
	--tb $black \
	--tf $sky \
	--fb $black \
	--ff $mauve \
	--nb $black \
	--nf $peach \
	--hb $black \
	--hf $green"
