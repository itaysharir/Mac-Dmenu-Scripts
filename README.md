# macOS dmenu scripts
- macOS compatible dmenu scripts
- Instructions to running dmenu on macos
- Patching dmenu on macOS

## Installation of dmenu scripts
### Clone this repository
Clone this repo with the following command: <br>
```git clone https://github.com/itaysharir/Mac-Dmenu-Scripts.git ~/dmenu\ scripts```
### IMPORTANT! unzip this file
- Unzip wallpaper/app.app.zip

### Quick Note ###
To use the second script that switches between rices, you need to install:
- sketchybar ```brew tap FelixKratz/formulae && brew install sketchybar```
- pywal - Install with [these instructions](https://github.com/dylanaraps/pywal/issues/515#issuecomment-616040266)

### Add keyblindings
- Install skhd - a tool that allows you to assign commands to keyblindings ```brew install koekeishiya/formulae/skhd``` <br>
- Add the following to your skhd config:
```
### Various dmenu scripts ###
cmd + shift - return : /bin/bash -l -c "sh ~/dmenu\ scripts/apps/script.sh"      # App launcher
cmd + shift - t : /bin/bash -l -c "sh ~/dmenu\ scripts/themes/.script.sh"        # Bar changer
cmd + shift - l : /bin/bash -l -c "sh ~/dmenu\ scripts/logout/.script.sh"        # Logout menu
cmd + shift - r : /bin/bash -l -c "sh ~/dmenu\ scripts/screenshot/.script.sh"    # Screenshot menu
cmd + shift - b : /bin/bash -l -c "sh ~/dmenu\ scripts/web/.script.sh"           # Search engine script
cmd + shift - e : /bin/bash -l -c "sh ~/dmenu\ scripts/editconfig/.script.sh"    # Edit conigs
cmd + shift - d : /bin/bash -l -c "sh ~/dmenu\ scripts/todo/.script.sh"          # Todo
cmd + shift - m : /bin/bash -l -c "sh ~/dmenu\ scripts/wallpaper/.script.sh"     # Wallpaper
```
### Install dependencies
- First of all, the obvious - Xquartz. Make sure it;s installed, if not install it with ```brew install xquartz```
- Install macports following the instuctions [here](https://www.macports.org/install.php). Then, run ```sudo port install dmenu && sudo port uninstall dmenu```
- (It make look pointless to install dmenu then uninstall it right away, but when installing dmenu all of the nececery dependencies are installed.)
## My build of dmenu
If you dont want to patch dmenu yourself, you can grab my already patched version of dmenu. <br>
My build of dmenu is the folder ```dmenu-4.9``` in the repo. To install it: <br>
- Make sure you have cloned the repository and that it is the active directory in the terminal. <br>
- Run the commannd ```sudo make install``` <br>
Now, if you added keyblindings to open dmenu and the scripts - you should be able to open the "run apps" dmenu script with ```cmd + shift + return```

## Build dmenu yourself
### Clone the dmenu repo
Clone the dmenu repo with the following command: <br>
```wget https://dl.suckless.org/tools/dmenu-4.9.tar.gz && cd dmenu-4.9```

### Modify config.mk (Important! dmenu will not build otherwise) <br>
- Delete all contents of config.mk <br>
- Paste the following in config.mk: <br>
```
# dmenu version
VERSION = 4.9

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = /usr/include/freetype2
# OpenBSD (uncomment)
#FREETYPEINC = $(X11INC)/freetype2

# includes and libs
INCS = `pkg-config --cflags x11 xinerama xft freetype2 fontconfig`
LIBS = `pkg-config --libs x11 xinerama xft freetype2 fontconfig`

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L -DVERSION=\"$(VERSION)\" $(XINERAMAFLAGS)
CFLAGS   = -std=c99 -pedantic -Wall -Os $(INCS) $(CPPFLAGS)
LDFLAGS  = $(LIBS)

# compiler and linker
CC = cc
```
- Make sure you are in the ```dmenu-4.9``` directory, and run ```sudo make install``` <br>
Now, if you added keyblindings to open dmenu and the scripts - you should be able to open dmenu with ```cmd + shift + return```
