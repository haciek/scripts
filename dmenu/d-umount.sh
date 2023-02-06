#!/usr/bin/env bash

exclude="\(/boot\|/home\|/\)$"
drives=$(lsblk -lp | grep "part /" | grep -v "$exclude" | awk '{print $1, "(" $4 ")" on $7 }')
[ -z "$drives" ] && exit
select=$(echo "$drives" | dmenu -p "Unmount drive:" | awk '{print $1}')
[ -z "$select" ] && exit
sh -c sudo umount "$select" && pgrep -x dunst && notify-send "$select unmounted"
