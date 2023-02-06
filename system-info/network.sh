#!/bin/sh

path=$( realpath "$0" )
dir=$( dirname "$path" )
file="${dir}/files/network"

# setting up default file
[ ! -f "$file" ] && echo "0 0" > "$file"

rx_bytes=$(cat /sys/class/net/*/statistics/rx_bytes | paste -sd "+")
tx_bytes=$(cat /sys/class/net/*/statistics/tx_bytes | paste -sd "+")

down=$(( rx_bytes / 1024 ))
up=$(( tx_bytes / 1024 ))

file_net_down=$(awk '(NR==1){print $1}' "$file")
file_net_up=$(awk '(NR==1){print $2}' "$file")

[ ${#file_net_down} -eq 0 ] && file_net_down="0"
[ ${#file_net_up}   -eq 0 ] && file_net_up="0"

net_down=$(( down - file_net_down ))
net_up=$(( up - file_net_up ))

[ $net_down -gt 1024 ] \
	&& net_down=$((net_down / 1024)) \
	&& unitD="Mib" \
	|| unitD="Kib"

[ $net_up -gt 1024 ] \
	&& net_up=$((net_up / 1024)) \
	&& unitU="Mib" \
	|| unitU="Kib"

status="🌐"
echo " $status ᐁ $net_down $unitD ᐃ $net_up $unitU "
echo "$down $up" > "$file"
