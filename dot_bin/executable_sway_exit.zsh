#!/usr/bin/env zsh

# Author: https://github.com/x0rzavi
# Description: Exit sway
# Dependencies: sway
# Theme: Catppuccin

# Variables
transparent='00000000'
black='1E1E2E'
lavender='B4BEFE'

swaynag \
	--text ${lavender} \
	--background ${black} \
	--button-text ${black} \
	--button-background ${lavender} \
	--border ${transparent} \
	--border-bottom ${transparent} \
	--border-bottom-size 0 \
	--button-border-size 0 \
	--button-padding 6 \
	--message-padding 6 \
	--button-gap 20 \
	--button-margin-right 15 \
	--layer top \
	--type warning \
	--font 'Iosevka Nerd Font' \
	--message ' Do you really want to exit sway?' \
	--button-no-terminal ' Yes ' 'swaymsg exit' \
	--dismiss ' No '