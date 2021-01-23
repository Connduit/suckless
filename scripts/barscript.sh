#xsetroot -name "top text; bottom text"

#date +"%I:%M %p"    = HH:MM AM/PM
#date +"%I:%M:%S %p" = HH:MM:SS AM/PM

#date +"%m.%d.%y"    = MM.DD.YY

#battery dir = /sys/class/power_supply/BAT0/

TIME=$(date +"%I:%M %p")
DATE=$(date +"%m.%d.%y")
BATT=$(cat /sys/class/power_supply/BAT0/capacity)

TBAR="$TIME | $BATT%"
BBAR="$DATE"

while true; do
	xsetroot -name "$TBAR;$BBAR"
	sleep 2
done
