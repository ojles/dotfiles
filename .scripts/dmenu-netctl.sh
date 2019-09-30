#!/bin/sh

chosen=$(sudo netctl list \
    | sort \
    | sed "s/[ *]\{2,\}\(.*\)/\1/" \
    | dmenu -i -fn Monospace-10 -p "Choose network:")

[ "$chosen" != "" ] || exit

notify-send "Connecting to '$chosen' network" &

sudo netctl stop-all
message=$(sudo netctl start "${chosen}" 2>&1)

if [ "$message" != "" ]; then
    notify-send "❌ Failed to establish connection with '$chosen'"
    notify-send "$message"
else
    notify-send "✔ Successfully connected to '$chosen'"
fi
