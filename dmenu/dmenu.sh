#!/usr/bin/env bash

declare -A scripts

path=$(realpath "$0")
dir=$(dirname "$path")

mapfile -t files < <(find "$dir" -maxdepth 1 -regex '.*d\-.*$')

IFS=$'\n'; mapfile -t sorted < <(sort <<<"${files[*]}"); unset IFS

# echo "${sorted[@]}"
for f in "${sorted[@]}"
do
    script="${f##*/}"
    name="${script##d-}"
    name="${name%%.sh}"
    scripts["${name^}"]="$script"
    # printf "%s: %s\n" "$name" "$script"
done

selected=$(echo "${!scripts[@]}" | sed 's/\s/\n/g' - | dmenu)
eval "${scripts["$selected"]}"
