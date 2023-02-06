#!/usr/bin/env bash

path=$(realpath "$0")
dir=$(dirname "$path")
file="$dir/files/emails"

declare -A emails

while read -r name email
do
    emails["$name"]="$email"
done < "$file"

select=$(echo "${!emails[@]}" | sed 's/\s/\n/g' - | dmenu)
email="${emails[$select]}"

echo "$email" | xclip -i -rmlastnl -selection "clipboard"
notify-send "Copied to a clipboard: $email"

