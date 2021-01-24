//Modify this file to change what commands output to your statusbar, and recompile using the make command.

//wifi-volume-month-day-year-power?
//xsetroot -name "top text; bottom text"

//date +"%I:%M %p"    = HH:MM AM/PM
//date +"%I:%M:%S %p" = HH:MM:SS AM/PM

//date +"%m.%d.%y"    = MM.DD.YY

//battery dir = /sys/class/power_supply/BAT0/
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	//{"Mem:", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},
	{"", "date '+%a, %b %d %I:%M%p'",					5,		0},
	{"",	"sb-volume.sh",	0,	10},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
