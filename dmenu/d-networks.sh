#!/usr/bin/env bash

declare -A networks
file="$HOME/scripts/dmenu/files/networks"

while read -r id pass
do
    networks["$id"]="$pass"
done < "$file"

ssid=$(echo "${!networks[@]}" | sed 's/\s/\n/g' - | dmenu)
passwd="${networks["$ssid"]}"

[ "${ssid}" == '' ] \
    && notify-send "No network selected!" \
    && exit

notify-send "Connecting..."
message="Connected to '$ssid'"

nmcli device wifi connect "$ssid" password "$passwd" \
    || message="Failed to connect to '$ssid'";
notify-send "$message"

