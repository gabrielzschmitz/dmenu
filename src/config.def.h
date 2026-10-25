/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;       /* -b  option; if 0, dmenu appears at bottom     */
static int horizpadbar = 20; /* horizontal padding */
static int vertpadbar = 12;  /* vertical padding */
static int fuzzy = 1; /* -F  option; if 0, dmenu doesn't use fuzzy matching */
static int centered = 1;    /* -c option; centers dmenu on screen */
static int min_width = 750; /* minimum width when centered */
static const float menu_height_ratio =
  4.0f; /* This is the ratio used in the original calculation */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char* fonts[] = {"SFMono Nerd Font:size=20"};
static const char* prompt =
  "󰀻 "; /* -p  option; prompt to the left of input field */
static const char passwdchar = '*'; /* char used for password -P option */
static const char* colors[SchemeLast][2] = {
  /*     fg         bg       */
  [SchemeNorm] = {"#abb2bf", "#14171c"},
  [SchemeSel] = {"#14171c", "#61afef"},
  [SchemeOut] = {"#181b21", "#56b6c2"},
  [SchemeNormHighlight] = {"#d19a66", "#14171c"},
  [SchemeSelHighlight] = {"#d19a66", "#61afef"},
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 8;
/* -h option; minimum height of a menu line */
static unsigned int lineheight = 50;
static unsigned int min_lineheight = 20;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* X resources to load at startup */
static const XResPref resources[] = {
  /* name                  type     address */
  {"dmenu.font", STRING, &fonts[0]},
  {"dmenu.prompt", STRING, &prompt},
  {"dmenu.foreground", STRING, &colors[SchemeNorm][ColFg]},
  {"dmenu.background", STRING, &colors[SchemeNorm][ColBg]},
  {"dmenu.foregroundSel", STRING, &colors[SchemeSel][ColFg]},
  {"dmenu.backgroundSel", STRING, &colors[SchemeSel][ColBg]},
  {"dmenu.foregroundOut", STRING, &colors[SchemeOut][ColFg]},
  {"dmenu.backgroundOut", STRING, &colors[SchemeOut][ColBg]},
  {"dmenu.foregroundNormHighlight", STRING,
   &colors[SchemeNormHighlight][ColFg]},
  {"dmenu.backgroundNormHighlight", STRING,
   &colors[SchemeNormHighlight][ColBg]},
  {"dmenu.foregroundSelHighlight", STRING, &colors[SchemeSelHighlight][ColFg]},
  {"dmenu.backgroundSelHighlight", STRING, &colors[SchemeSelHighlight][ColBg]},
  {"dmenu.topbar", INTEGER, &topbar},
  {"dmenu.lines", INTEGER, &lines},
};
