#!/usr/bin/env bash

path=$(realpath "$0")
dir=$(dirname "$path")
file="$dir/files/quickstart"

selected=$(dmenu -p "Quickstart:" < "$file")

[ "$selected" == "" ] && exit 1
"$selected" && notify-send "Starting: $selected"
