#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Lock sway with swaylock-effects
# Dependencies: sway
# Theme: Catppuccin

# Variables
transparent=00000000
lavender=B4BEFE
black=1E1E2E
peach=FAB387
yellow=F9E2AF
green=A6E3A1
red=F38BA8
wallpapers_path=$HOME/Pictures/Wallpapers

swaylock \
	--ignore-empty-password \
	--show-failed-attempts \
	--fade-in 0.25 \
	--daemonize \
	--indicator \
	--clock \
	--timestr "%I:%M %p" \
	--datestr "%b %d, %G" \
	--screenshots \
	--indicator-caps-lock \
	--image $(find $wallpapers_path -type f | shuf -n 1) \
	--scaling fill \
	--effect-blur 2x2 \
	--effect-vignette 0.1:0.8 \
	--font "Iosevka Nerd Font" \
	--font-size 45 \
	--indicator-radius 170 \
	--indicator-thickness 15 \
	--bs-hl-color $lavender \
	--key-hl-color $lavender \
	--caps-lock-bs-hl-color $lavender \
	--caps-lock-key-hl-color $lavender \
	--inside-color $black \
	--inside-clear-color $black \
	--inside-caps-lock-color $black \
	--inside-ver-color $black \
	--inside-wrong-color $black \
	--line-color $transparent \
	--line-clear-color $transparent \
	--line-caps-lock-color $transparent \
	--line-ver-color $transparent \
	--line-wrong-color $transparent \
	--ring-color $peach \
	--ring-clear-color $yellow \
	--ring-caps-lock-color $peach \
	--ring-ver-color $green \
	--ring-wrong-color $red \
	--separator-color $transparent \
	--text-color $lavender \
	--text-clear-color $lavender \
	--text-ver-color $lavender \
	--text-wrong-color $lavender \
	--text-caps-lock-color $lavender 
