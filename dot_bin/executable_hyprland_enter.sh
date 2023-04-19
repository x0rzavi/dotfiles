#!/bin/env dash

# Author: https://github.com/x0rzavi
# Description: Launch hyprland
# Dependencies: Hyprland

export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=Hyprland

export GDK_BACKEND=wayland,x11
export SDL_VIDEODRIVER=wayland
export CLUTTER_BACKEND=wayland
export CLUTTER_BACKEND=wayland
export WINIT_UNIX_BACKEND=wayland

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM="wayland;xcb"
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

export _JAVA_AWT_WM_NONREPARENTING=1
export NO_AT_BRIDGE=1

# https://github.com/swaywm/sway/issues/7025
# https://gitlab.freedesktop.org/wlroots/wlroots/-/blob/master/docs/env_vars.md
# export WLR_DRM_NO_MODIFIERS=1
export GNOME_KEYRING_CONTROL="/run/user/1000/keyring"
export SSH_AUTH_SOCK="/run/user/1000/keyring/ssh"

dbus-run-session -- Hyprland
