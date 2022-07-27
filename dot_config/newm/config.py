from __future__ import annotations
from glob import escape
from typing import Callable, Any

import os
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

background = {
    'path': os.environ['HOME'] + '/Pictures/Wallpapers/1658219556.jpg',
    'anim': True,
}

corner_radius = 0

focus = {
    'color': '#F8BD96',
    'distance': 2,
}

outputs = [
    { 'name': 'eDP-1' },
    { 'name': 'virt-1', 'pos_x': -1280, 'pos_y': 0, 'width': 1280, 'height': 720 }
]

pywm = {
    'enable_xwayland': True,
    'xcursor_theme': 'Fluent-dark-cursors'
}

def rules(view):
    blur_apps = ("foot", "Alacritty")
    app_rule = None
    if view.app_id in blur_apps:
        app_rule = {"blur": {"radius": 3, "passes": 4}}
    return app_rule
    
view = {
    'padding': 10,
    'corner_radius': 10,
    'rules': rules
}

gestures = {
    'pyevdev': { 'enabled': True },
}

def on_startup():
    startup = (
        "dbus-update-activation-environment --all",
        "/usr/libexec/polkit-gnome-authentication-agent-1",
        "foot --server",
        "mpd",
        "mpd-mpris",
        "gentoo-pipewire-launcher",
        "wlsunset -l 22.6 -L 88.4 -t 4800",
        "xsettingsd",
        "wl-paste --watch cliphist store"
    )
    for command in startup:
        os.system(f"{command} &")

def key_bindings(layout: Layout) -> list[tuple[str, Callable[[], Any]]]:
    mod = 'L-'
    alt = 'A-'
    shift = 'S-'
    ctrl = 'C-'

    terminal = 'foot &'
    terminal_alt = 'alacritty &'
    browser = 'firefox-bin &'
    browser_alt = 'google-chrome-unstable --enable-features=WebUIDarkMode --force-dark-mode &'

    return [
        (mod + "Left", lambda: layout.move(-1, 0)),
        (mod + "Down", lambda: layout.move(0, 1)),
        (mod + "Up", lambda: layout.move(0, -1)),
        (mod + "Right", lambda: layout.move(1, 0)),
        (mod + "u", lambda: layout.basic_scale(1)),
        (mod + "n", lambda: layout.basic_scale(-1)),
        (mod + "t", lambda: layout.move_in_stack(1)),

        (mod + shift + "Left", lambda: layout.move_focused_view(-1, 0)),
        (mod + shift + "Down", lambda: layout.move_focused_view(0, 1)),
        (mod + shift + "Up", lambda: layout.move_focused_view(0, -1)),
        (mod + shift + "Right", lambda: layout.move_focused_view(1, 0)),

        (mod + ctrl + "Left", lambda: layout.resize_focused_view(-1, 0)),
        (mod + ctrl + "Down", lambda: layout.resize_focused_view(0, 1)),
        (mod + ctrl + "Up", lambda: layout.resize_focused_view(0, -1)),
        (mod + ctrl + "Right", lambda: layout.resize_focused_view(1, 0)),

        (mod + "Return", lambda: os.system(terminal)),
        (mod + shift + "Return", lambda: os.system(terminal_alt)),
        (mod + "b", lambda: os.system(browser)),
        (mod + shift + "b", lambda: os.system(browser_alt)),
        
        (mod + "c", lambda: layout.close_focused_view()),

        (mod + shift + "l", lambda: layout.ensure_locked(dim=True)),
        (mod + shift + "q", lambda: layout.terminate()),
        (mod + "Escape", lambda: layout.update_config()),

        (mod + "f", lambda: layout.toggle_fullscreen()),

        (mod, lambda: layout.toggle_overview()),

        ("XF86MonBrightnessUp", lambda: os.system("brightness.sh --inc")),
        ("XF86MonBrightnessDown", lambda: os.system("brightness.sh --dec")),
        ("XF86AudioPlay", lambda: os.system("playerctl play-pause")),
        ("XF86AudioNext", lambda: os.system("playerctl next")),
        ("XF86AudioPrev", lambda: os.system("playerctl previous")),
        ("XF86AudioRaiseVolume", lambda: os.system("volume.sh --inc")),
        ("XF86AudioLowerVolume", lambda: os.system("volume.sh --dec")),
        ("XF86AudioMute", lambda: os.system("volume.sh --toggle")),
    ]

panels = {
    'lock': {
        'cmd': 'foot -e newm-panel-basic lock',
    },
    'launcher': {
        'cmd': 'foot -e newm-panel-basic launcher'
    },
    'top_bar': {
        'native': {
            'enabled': True,
            'texts': lambda: [
                pwd.getpwuid(os.getuid())[0],
                time.strftime("%c"),
            ],
        }
    },
    'bottom_bar': {
        'native': {
            'enabled': True,
            'texts': lambda: [
                "newm",
                "powered by pywm"
            ],
        }
    },
}

