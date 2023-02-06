#!/usr/bin/env bash

sel=$(man -k . | dmenu -l 20 -p "Select manual: ")
[ -z "$sel" ] && exit 0
echo "$sel" | awk '{print $1}' | xargs -r man -Tpdf | zathura -


