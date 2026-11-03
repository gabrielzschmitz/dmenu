# dmenu version
VERSION = 5.4

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man
ICONPREFIX = $(PREFIX)/share/icons
ICONPATH = $(ICONPREFIX)/hicolor/256x256/apps/dmenu.png

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

# Xinerama
XINERAMALIBS = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# FreeType
FREETYPEINC = /usr/include/freetype2
FREETYPELIBS = -lfontconfig -lXft

# OpenBSD:
#FREETYPEINC = $(X11INC)/freetype2
#MANPREFIX = ${PREFIX}/man

PKG_CONFIG = pkg-config

# includes and libs
INCS = -I$(X11INC) \
       -I$(FREETYPEINC) \
       `$(PKG_CONFIG) --cflags imlib2`

LIBS = -L$(X11LIB) -lX11 -lm \
       `$(PKG_CONFIG) --libs imlib2` \
       $(XINERAMALIBS) \
       $(FREETYPELIBS)

# flags
CPPFLAGS = -DVERSION=\"$(VERSION)\" \
           -DICONPATH=\"$(ICONPATH)\" \
           -D_DEFAULT_SOURCE -D_BSD_SOURCE \
           -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L \
           $(XINERAMAFLAGS)

CFLAGS = -std=c99 -pedantic -Wall -Os \
         $(INCS) $(CPPFLAGS)

LDFLAGS = $(LIBS)

# OpenBSD:
#CPPFLAGS = -DVERSION=\"$(VERSION)\" -D_DEFAULT_SOURCE -D_BSD_SOURCE \
#           -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L
#LIBS = -L$(X11LIB) -lX11 -lm \
#       `$(PKG_CONFIG) --libs imlib2` \
#       $(FREETYPELIBS)
#MANPREFIX = ${PREFIX}/man

# compiler and linker
CC = cc
