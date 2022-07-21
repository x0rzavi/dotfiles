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
	--ignorecase \
	--list 5 \
	--prefix '' \
	--prompt 'COPY   ' \
	--ifne \
	--fork \
	--line-height 25 \
	--cw 5 \
	--fn 'Iosevka Nerd Font Bold 12' \
	--tb $black \
	--tf $peach \
	--fb $black \
	--ff $mauve \
	--nb $black \
	--nf $peach \
	--hb $black \
	--hf $green \
	--ab $black \
	--af $sky \
	--bdr $mauve \
	--cb $black \
	--cf $mauve | \
	cliphist decode | \
	wl-copy
