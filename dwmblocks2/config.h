//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"",	"sb-memory",	10,	14},
	//{"",	"sb-forecast",	18000,	5},
	{"",	"sb-volume.sh",	0,	10},
	{"",	"sb-bright",	0,	15},
	{"",	"sb-battery",	5,	3},
	{"",	"sb-clock",	60,	1},
	//{"",	"sb-internet",	5,	4},
};

//Sets delimiter between status commands. NULL character ('\0') means no delimiter.
//static char *delim = " ";
static char *delim = " | ";
static unsigned int delimLen = 5;

// Have dwmblocks automatically recompile and run when you edit this file in
// vim with the following line in your vimrc/init.vim:

// autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid dwmblocks & }
