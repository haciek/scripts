#!/bin/sh

# notify-send "CPU usage:
# $(ps axch -o cmd:16,%cpu --sort=-%cpu | head -n 5)"

# file=$(echo "$0" | sed "s/\(.*\/\).*/\1.cpu/")
# cat "$file"

cpu_temp=$(sensors | sed -rn 's/.*Core 0:\s+.([^ ]+).*/\1/p')
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | cut -f1 -d"." | awk '{print 100 - $1"% "}')
ram_usage=$(free -h | awk '/^Mem:/ { print $3 }') #'"/" $2}')
# echo "| 🔥 $cpu_temp 💡 $cpu_usage" > "$file"
echo " 💾 $ram_usage  🔥 $cpu_temp  💡 $cpu_usage "
