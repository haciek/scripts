#!/bin/sh

date=$(date '+%Y-%m-%d')
pth="$HOME/doc/pics/screenshot"
count=$(ls $pth | grep -c $date)
case "$1" in
    copy) import -screen "$pth/temp.png" && \
        xclip -selection clipboard -t image/png "$pth/temp.png" && \
        notify-send "Image copied to clipboard!" ;;
    save) import -screen "$pth/prtScreen-$date#$count.png" && \
        xclip -selection clipboard -t image/png "$pth/prtScreen-$date#$count.png" && \
        notify-send "Image saved & copied!" ;;
esac
