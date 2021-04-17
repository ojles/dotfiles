#!/bin/bash

delim='|'

date="$(date +'%A, %d of %b, %G - %H:%M:%S')"
battery_charging="$(cat /sys/class/power_supply/AC/online)"
[[ $battery_charging == 1 ]] && battery_charging_label=" (Charging)"
battery="Battery: %$(cat /sys/class/power_supply/BAT0/capacity)${battery_charging_label}"
curr_brightness=$(cat /sys/class/backlight/intel_backlight/actual_brightness)
max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
brightness="Brightness: %$(( (curr_brightness * 100) / max_brightness ))"
volume_level="Volume: %$(pulseaudio-ctl full-status | cut -d ' ' -f1,2 | sed 's/yes/(Mute)/;s/ no//')"

echo -n "$volume_level $delim $brightness $delim $battery $delim $date"
