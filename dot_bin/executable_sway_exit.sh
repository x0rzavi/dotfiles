#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Exit sway
# Dependencies: sway
# Theme: Catppuccin

# Variables
transparent=00000000
black=1E1E2E
flamingo=F2CDCD

swaynag \
	--text $flamingo \
	--background $black \
	--button-text $black \
	--button-background $flamingo \
	--border $transparent \
	--border-bottom $transparent \
	--border-bottom-size 0 \
	--button-border-size 0 \
	--button-padding 8 \
	--message-padding 8 \
	--button-gap 10 \
	--button-margin-right 10 \
	--layer top \
	--type warning \
	--font 'Iosevka Nerd Font Bold 12' \
	--message 'Do you really want to EXIT sway?' \
	--button-no-terminal 'YES' 'swaymsg exit' \
	--dismiss 'NO'
