#!/bin/bash

link=$( dmenu -p "Torrent/Magnet link: " )
dirs=$( find "$HOME" -type d -maxdepth 1 2>/dev/null )
dir=$( echo "$dirs" | sed 's/ /\n/g' | dmenu -p "Directory: " )

command="aria2c --seed-time=0 -d"
eval "$TERMINAL" -e "$command" "$dir" "$link"
