#!/bin/sh
ibus engine xkb:us::eng &
picom -b --experimental-backends &
xss-lock --transfer-sleep-lock -- betterlockscreen -l blur &
feh --bg-fill --randomize ~/Pictures/wallpapers/gruvbox_elden_ring.jpg &
