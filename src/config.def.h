/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1; /* -b  option; if 0, dmenu appears at bottom     */
static int fuzzy  = 1; /* -F  option; if 0, dmenu doesn't use fuzzy matching */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char* fonts[] = {"SFMono Nerd Font:size=20"};
static const char* prompt =
  NULL; /* -p  option; prompt to the left of input field */
static const char* colors[SchemeLast][2] = {
  /*     fg         bg       */
  [SchemeNorm] = {"#abb2bf", "#1e222a"},
  [SchemeSel] = {"#1e222a", "#67b0e8"},
  [SchemeOut] = {"#000000", "#00ffff"},
  [SchemeNormHighlight] = {"#ffc978", "#1e222a"},
  [SchemeSelHighlight] = {"#ffc978", "#67b0e8"},
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
