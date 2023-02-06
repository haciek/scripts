#!/bin/bash

path=$(realpath "$0")
dir=$(dirname "$path")
file="$dir/files/bookmarks"

declare -A bookmarks

while read -r name url
do
    bookmarks["$name"]="$url"
done < "$file"

selected=$(echo "${!bookmarks[@]}" | sed 's/\s/\n/g' - | dmenu)

[ "$selected" == "Modify" ] && "$TERMINAL" -e "$EDITOR" "$file" && exit 0
[ "$selected" == ""       ] && exit 0

link="${bookmarks["$selected"]}"
"$BROWSER" "$link"
