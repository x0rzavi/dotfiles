#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Cliphist invoker with bemenu
# Dependencies: bemenu, cliphist
# Theme: Catppuccin

# Variables
black="#1E1E2E" 
sky="#89DCEB"
mauve="#CBA6F7" 
peach="#FAB387"
green="#A6E3A1"

cliphist list | \
	bemenu \
	--prefix '' \
	--prompt 'COPY  ' \
	--list 5 \
	--fn 'Iosevka Nerd Font Bold 12' \
	--tb $black \
	--tf $sky \
	--fb $black \
	--ff $mauve \
	--nb $black \
	--nf $peach \
	--hb $black \
	--hf $green | \
	cliphist decode | \
	wl-copy
