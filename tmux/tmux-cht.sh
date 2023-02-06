#!/usr/bin/env bash
#
path=$(realpath "$0" )
dir=$(dirname "$path")
files="${dir}/files"

selected=$( cat "$files/tmux-cht-languages" "$files/tmux-cht-command" | fzf )
if [[ -z $selected ]]; then
    exit 0
fi
read -rp "Query: " query

if grep -qs "$selected" ~/.tmux-cht-languages; then
    query=$( echo "$query" | tr ' ' '+' )
    tmux neww bash -c "echo \"curl cht.sh/$selected/$query/\" & curl cht.sh/$selected/$query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl -s cht.sh/$selected~$query | less"
fi
