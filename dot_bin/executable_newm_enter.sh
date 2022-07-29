#!/usr/bin/env bash

# Author: https://github.com/x0rzavi
# Description: Launch newm
# Dependencies: newm
# Reference: https://github.com/jbuchermn/newm/blob/master/doc/env_wayland.md

# xdg-desktop-portal-wlr quirks
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=wlroots
export XDG_CURRENT_DESKTOP=wlroots
export XDG_CURRENT_SESSION=wlroots

# dbus starts gnome-keyring-daemon service, so apply necessary envs
export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh

# Complete gnome-keyring-daemon initialization for secrets
#eval $(gnome-keyring-daemon --start | /bin/sed 's/^\(.*\)/export \1/g')

# Launch sway within a dbus user session
dbus-run-session -- start-newm
