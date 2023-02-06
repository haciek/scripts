#!/usr/bin/env bash

part=$(lsblk -lp | grep "part $" | awk '{print $1, "(" $4 ")"}')
[ -z "$part" ] && exit 1

select=$(echo "$part" | dmenu -p "Select drive:"| awk '{print $1}')
[ -z "$select" ] && exit 1

passwd=$(dmenu -p "Input password: " )
echo "$passwd" | sudo -S mount "$select" && exit 0
dirs=$(find /mnt -type d -maxdepth 1 2>/dev/null)
mntpt=$(echo "$dirs" | dmenu -p "Mount to:")
[ -z "$mntpt" ] && exit 1

[ ! -d "$mntpt" ] \
    && makedir=$(printf "Make\nAbort" | dmenu -p "$mntpt doesn't exist.") && \
    [ "$makedir" = "Make" ] && sudo mkdir -p "$mntpt"

sudo -S mount "$select" "$mntpt" \
    && (pgrep -x dunst && notify-send "$select mounted to $mntpt")
