
battery="/sys/class/power_supply/BAT0"

capacity=$(cat "$battery/capacity")
printf "%d%%" "$capacity"
exit 0
