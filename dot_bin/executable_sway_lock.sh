#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Lock sway with swaylock-effects
# Dependencies: sway
# Theme: Catppuccin

# Variables
transparent=00000000
lavender=C9CBFF
black=161320
peach=F8BD96
yellow=FAE3B0
green=ABE9B3
red=F28FAD
wallpapers_path=$HOME/Pictures/unsplash

swaylock \
	--ignore-empty-password \
	--show-failed-attempts \
	--fade-in 0.25 \
	--daemonize \
	--grace 15 \
	--grace-no-mouse \
	--grace-no-touch \
	--clock \
	--timestr "%I:%M %p" \
	--datestr "%b %d, %G" \
	--screenshots \
	--image $(find $wallpapers_path -type f | shuf -n 1) \
	--scaling fill \
	--effect-vignette 0.1:0.8 \
	--font "JetBrainsMono Nerd Font" \
	--font-size 30 \
	--indicator-radius 150 \
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
