#!/bin/sh

([ "$(pgrep -x picom)" ] && pkill -x picom) \
    || picom -b >/dev/null 2>&1 &
