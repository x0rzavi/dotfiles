#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Launch hyprland
# Dependencies: Hyprland

export GNOME_KEYRING_CONTROL="/run/user/1000/keyring"
export SSH_AUTH_SOCK="/run/user/1000/keyring/ssh"

dbus-run-session -- Hyprland