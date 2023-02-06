#!/bin/sh

case "$1" in
    mute) pulsemixer --toggle-mute ;;
    up) pulsemixer --change-volume +5 ;;
    down) pulsemixer --change-volume -5 ;;
    man) ([ "$(pgrep -x "pulsemixer")" ] \
        && pkill -x "pulsemixer") \
        || setsid st -e "pulsemixer" ;;
esac
# pkill -RTMIN+11 dwmblocks
