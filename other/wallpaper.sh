#!/bin/sh
# wall="orange/golden_shore.jpg"
wall="nature/"
while true
do
    # nitrogen "$HOME/doc/pics/wallpapers/$wall" --set-auto --random
    nitrogen "$HOME/pictures/$wall" --set-zoom-fill --random
    #nitrogen "$HOME/pictures/orange/" --set-auto --random #--head=0

    sleep 100
done
