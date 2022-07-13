#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Launch sway
# Dependencies: sway
# Derived: https://blog.realogs.in/getting-secrets-to-work-with-sway/
# Derived: https://github.com/uditkarode/dots/blob/master/scripts/swaylaunch

# xdg-desktop-portal-wlr quirks
export XDG_CURRENT_DESKTOP=sway

# Keyring daemon for secrets
eval $(gnome-keyring-daemon --start | sed 's/^\(.*\)/export \1/g')

# Launch sway 
sway
