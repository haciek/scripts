#!/bin/sh

vol=$(pulsemixer --get-volume | awk '{print $1}')
[ "$vol" -lt 50 ] && icon="🔈"  ||  icon="🔊"
[ "$(pulsemixer --get-mute)" -eq 1 ] && icon="🔇"
echo " $icon $vol% "
