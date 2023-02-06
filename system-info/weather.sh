#!/bin/sh

wttr=$(curl -s wttr.in/\?format="%c+%t" 2> /dev/null | sed 's/\ //' )
[ -n "$wttr" ] && echo " $wttr "

