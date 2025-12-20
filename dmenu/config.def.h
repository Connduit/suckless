/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

#define BRIGHT_PINK "#FF66B2" // NOTE: this is color should be used as a way to tell when a rare color scheme is being used 
#define AQUA_BLUE "#02D8E9"

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom */
static int fuzzy = 1;                       /* -F  option; if 0, dmenu doesn't use fuzzy matching */
static int colorprompt = 1;                 /* -p  option; if 1, prompt uses SchemeSel, otherwise SchemeNorm */
static int centered = 1;                    /* -c option; centers dmenu on screen */
static int min_width = 500;                 /* minimum width when centered */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = { "Roboto Mono:size=16:antialias=true:autohint=true" };
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#c4c1c1", "#160909" }, // main text color, main bg color
	[SchemeSel] = { "#c4c1c1", "#756160" }, // first match text color, bg color for it
	[SchemeOut] = { "#c4c1c1", "#F64D4B" }, // NOTE: nothing?
    [SchemeMid] = {"#c4c1c1", "#160909"}, // Color for the "entry" right below the first match?
    [SchemeHp] = {BRIGHT_PINK, AQUA_BLUE}, // NOTE: nothing?
    [SchemeOutHighlight] = {BRIGHT_PINK, AQUA_BLUE}, // NOTE: nothing?
    [SchemeSelHighlight] = {"#F64D4B", "#756160"},
    [SchemeNormHighlight] = {"#F64D4B", "#160909"}, // text color, text highlight  (highlight matching fuzz letters?)
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
/* -h option; minimum height of a menu line */
static unsigned int lineheight = 0;
static unsigned int min_lineheight = 8;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static const unsigned int border_width = 5;
