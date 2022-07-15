#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Bemenu-run
# Dependencies: bemenu
# Theme: Catppuccin

# Variables
black="#1E1E2E" 
sky="#89DCEB"
mauve="#CBA6F7" 
peach="#FAB387"
green="#A6E3A1"

bemenu-run \
	--prefix '' \
	--prompt 'RUN  ' \
	--list 5 \
	--fn 'Iosevka Nerd Font Bold 12' \
	--tb $black \
	--tf $sky \
	--fb $black \
	--ff $mauve \
	--nb $black \
	--nf $peach \
	--hb $black \
	--hf $green
