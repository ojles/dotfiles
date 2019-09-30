#!/bin/sh
xrandr --output LVDS --off --output DisplayPort-0 --mode 2560x1440 --pos 1080x120 --rotate normal --output DisplayPort-1 --off --output DisplayPort-2 --off --output VGA-0 --mode 1920x1080 --pos 0x0 --rotate right

compton

feh --bg-scale ~/.config/i3/wallpaper.jpg &
