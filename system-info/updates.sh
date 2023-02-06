#!/bin/sh

update=$(checkupdates | wc -l)
# aur=$(checkupdates-aur | wc -l)
echo " 🔄 $update "

