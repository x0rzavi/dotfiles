from __future__ import annotations
from glob import escape
from typing import Callable, Any

import os
import random
import pwd
import time
import logging

from newm.layout import Layout
from newm.helper import BacklightManager, WobRunner, PaCtl

from pywm import (
    PYWM_MOD_LOGO,
    PYWM_MOD_ALT
)

logger = logging.getLogger(__name__)

outputs = [
    { 'name': 'eDP-1' },
    # { 'name': 'virt-1', 'pos_x': -1280, 'pos_y': 0, 'width': 1280, 'height': 720 }
]

pywm = {
    'enable_xwayland': True,
    'xkb_options': 'numpad:mac',
    'xcursor_theme': 'Qogir-white-cursors',
}

wallpaper_path = os.environ['HOME'] + '/Pictures/Wallpapers/'
background = {
    'path': wallpaper_path + random.choice(os.listdir(wallpaper_path)),
    'anim': True,
    'time_scale': 0.2
}

corner_radius = 0
# anim_time = 0.2

def rules(view):
    print(view)
    blur_apps_id = ('foot', 'Alacritty', 'wofi', 'waybar')
    float_apps_fix = ('Firefox — Sharing Indicator')
    float_apps_title = ('Choose Files', 'Stats', 'Picture-in-Picture')
    float_apps_id = ('mpv', 'imv')
    window_roles = ('pop-up', 'bubble', 'dialog', 'task_dialog')
    app_rule = None
    if view.app_id in blur_apps_id:
        app_rule = {'blur': {'radius': 4, 'passes': 4}, 'opacity': 0.8}
    if view.title in float_apps_fix:
        app_rule = { 'float': True, 'float_size': (30, 30)}
    if view.app_id in float_apps_id:
        app_rule = { 'float': True, 'float_size': (1366, 768), 'float_pos': (0.5, 0.5)}
    if view.role in window_roles or view.title in float_apps_title:
        app_rule = { 'float': True, 'float_size': (700, 500), 'float_pos': (0.5, 0.5)}
    return app_rule

view = {
	'corner_radius': 0,
    'padding': 10,
    'rules': rules,
    'ssd': {'enabled': False}
}

focus = {
    'color': '#b4befe',
    'distance': 2,
}

def key_bindings(layout: Layout) -> list[tuple[str, Callable[[], Any]]]:
    mod = 'L-'
    alt = 'A-'
    shift = 'S-'
    ctrl = 'C-'

    terminal = 'footclient &'
    terminal_alt = 'alacritty &'
    browser = 'firefox-bin &'
    file_manager = 'footclient nnn &'
    launcher = 'wofi &'
    ss_copy = 'grim -l 0 - | wl-copy &'
    ss_save = 'GRIM_DEFAULT_DIR=~/Pictures/Screenshots/ grim -l 0 &'
    ss_area_copy = 'grim -l 0 -g "$(slurp)" - | wl-copy &'
    ss_area_save = 'GRIM_DEFAULT_DIR=~/Pictures/Screenshots/ grim -l 0 -g "$(slurp)" &'

    return [
        (mod + 'Left', lambda: layout.move(-1, 0)),
        (mod + 'Down', lambda: layout.move(0, 1)),
        (mod + 'Up', lambda: layout.move(0, -1)),
        (mod + 'Right', lambda: layout.move(1, 0)),
        (mod + 'u', lambda: layout.basic_scale(1)),
        (mod + 'n', lambda: layout.basic_scale(-1)),
        (mod + 'Tab', lambda: layout.move_in_stack(1)),

        (mod + shift + 'Left', lambda: layout.move_focused_view(-1, 0)),
        (mod + shift + 'Down', lambda: layout.move_focused_view(0, 1)),
        (mod + shift + 'Up', lambda: layout.move_focused_view(0, -1)),
        (mod + shift + 'Right', lambda: layout.move_focused_view(1, 0)),

        (mod + ctrl + 'Left', lambda: layout.resize_focused_view(-1, 0)),
        (mod + ctrl + 'Down', lambda: layout.resize_focused_view(0, 1)),
        (mod + ctrl + 'Up', lambda: layout.resize_focused_view(0, -1)),
        (mod + ctrl + 'Right', lambda: layout.resize_focused_view(1, 0)),

        ('Print', lambda: os.system(ss_copy)),
        (mod + 'Print', lambda: os.system(ss_save)),
        (shift + 'Print', lambda: os.system(ss_area_copy)),
        (mod + shift + 'Print', lambda: os.system(ss_area_save)),

        (mod + shift + 'l', lambda: layout.ensure_locked(dim=True)),
        (mod + shift + 'q', lambda: layout.terminate()),
        (mod + 'Escape', lambda: layout.update_config()),
        
        (mod, lambda: layout.toggle_overview()),
        (mod + 'c', lambda: layout.close_focused_view()),
        (mod + 'f', lambda: layout.toggle_fullscreen()),
        (mod + 'SPC', lambda:  layout.toggle_focused_view_floating()),

        (mod + 'd', lambda: os.system(launcher)),
        (mod + 'Return', lambda: os.system(terminal)),
        (mod + shift + 'Return', lambda: os.system(terminal_alt)),
        (mod + 'b', lambda: os.system(browser)),
        (mod + shift + 'f', lambda: os.system(file_manager)),

        ('XF86MonBrightnessUp', lambda: os.system("brightness.sh -i &")),
        ('XF86MonBrightnessDown', lambda: os.system("brightness.sh -d &")),
        ('XF86AudioPlay', lambda: os.system("playerctl play-pause &")),
        ('XF86AudioNext', lambda: os.system("playerctl next &")),
        ('XF86AudioPrev', lambda: os.system("playerctl previous &")),
        ('XF86AudioRaiseVolume', lambda: os.system("volume.sh -i &")),
        ('XF86AudioLowerVolume', lambda: os.system("volume.sh -d &")),
        ('XF86AudioMute', lambda: os.system("volume.sh -t &")),
    ]

def on_startup():
    startup = (
        "dbus-update-activation-environment --all",
        "gnome-keyring-daemon --start",
        "foot --server",
        "/usr/libexec/polkit-gnome-authentication-agent-1",
        "gentoo-pipewire-launcher",
        "wlsunset -l 22.6 -L 88.4 -t 4800",
        "wl-paste --watch cliphist store",
        "mpd",
        "xsettingsd",
        "xsetroot -cursor_name left_ptr"
    )
    for command in startup:
        command = f"{command} &"
        os.system(command)

def on_reconfigure():
    gnome_schema = 'org.gnome.desktop.interface'
    gnome_peripheral = 'org.gnome.desktop.peripherals'
    gnome_wm = 'org.gnome.desktop.wm.preferences'
    aesthetics = (
        f"gsettings set {gnome_schema} gtk-theme 'Colloid'",
        f"gsettings set {gnome_schema} color-scheme 'prefer-dark'",
        f"gsettings set {gnome_schema} cursor-theme 'Qogir-white-cursors'",
        f"gsettings set {gnome_schema} icon-theme 'Fluent-dark'",
        f"gsettings set {gnome_schema} font-name 'SF Pro Text 10.5'",
        f"gsettings set {gnome_schema} document-font-name 'New York Small 10.5'",
        f"gsettings set {gnome_schema} monospace-font-name 'SFMono 10.5'",
        f"gsettings set {gnome_wm} button-layout :",
        f"gsettings set {gnome_wm} theme 'Colloid-Dark'",
        f"gsettings set {gnome_peripheral}.keyboard repeat-interval 30",
        f"gsettings set {gnome_peripheral}.keyboard delay 100",
        f"gsettings set {gnome_peripheral}.mouse natural-scroll true",
        f"gsettings set {gnome_peripheral}.mouse speed 0.0",
        f"gsettings set {gnome_peripheral}.mouse accel-profile 'default'",
    )

    for config in aesthetics:
        config = f"{config} &"
        os.system(config)

# def idle_callback(code: str) -> None:
#     if code in ["lock", "idle-lock"]:
#         os.system('volume.sh --mute &')

energy = {
    # 'idle_times': [5, 5, 600],
    'suspend_command': 'loginctl suspend'
}

gestures = {
    'pyevdev': { 'enabled': True },
}

# swipe = {
#     'gesture_factor': 3,
# }

panels = {
    'lock': {
        'cmd': 'foot -e newm-panel-basic lock',
    },
    'launcher': {
        'cmd': 'foot -e newm-panel-basic launcher'
    },
    'bar': {
        'cmd': 'waybar',
        'visible_fullscreen': False
    }
}
