# macOS dmenu scripts
- macOS compatible dmenu scripts
- Instructions to running dmenu on macos
- Patching dmenu on macOS

## Installation of dmenu scripts
### Clone this repository
Clone this repo with the following command: <br>
```git clone https://github.com/itaysharir/Mac-Dmenu-Scripts.git ~/dmenu\ scripts```
### Quick Note ###
To use the second script that switches between rices, you need to install:
- sketchybar ```brew tap FelixKratz/formulae && brew install sketchybar```
- pywal - Install with [these instructions](https://github.com/dylanaraps/pywal/issues/515#issuecomment-616040266)

### Add keyblindings
- Install skhd - a tool that allows you to assign commands to keyblindings ```brew install koekeishiya/formulae/skhd```
- Add the following to your skhd config:
``` ### Various dmenu scripts ###
# Note: Some things are configured in XQuartz, this wont work out of the box
cmd + shift - return : open -a Xquartz && skhd -k "cmd - n"     # App launcher
cmd + shift - t : open -a Xquartz && skhd -k "cmd - t"          # Bar changer
cmd + shift - l : open -a XQuartz && skhd -k "cmd - p"          # Logout menu
cmd + shift - r : open -a XQuartz && skhd -k "cmd - r"          # Screenshot menu
cmd + shift - b : open -a XQuartz && skhd -k "cmd - o"          # Search engine script
cmd + shift - e : open -a XQuartz && skhd -k "cmd - f"          # Edit conigs
cmd + shift - d : open -a XQuartz && skhd -k "cmd - d"          # Todo
cmd + shift - m : open -a XQuartz && skhd -k "cmd - a"          # Wallpaper 
```
- Make sure Xquartz is installed. If not, install it with homebrew: ```brew install xquartz```
- Open Xquartz. In the menu bar go to Applications < Customize...
- On the window that opened, add the following items:
```
+---------------------------------------------------------------------+----------+
|    Name    |                        Command                         | Shortcut |
+---------------------------------------------------------------------+----------+
| dmenu      | ls -d /Applications/*.app /System/Applications/*.app   |          |
|            | /Applications/Utilities/*.app | sed -r 's/^.+\///'     |          |
|            | | rev | cut -c5- | rev | dmenu -i | xargs -I {}        |    n     |
|            | open -a  "{}"                                          |          |
|------------|--------------------------------------------------------|----------|
| dmenu-bar  | cd ~/dmenu\ scripts/themes; ls | dmenu -i -l 20 -p     |    t     |
|            | "Change Bar:"| xargs -I {} sh "{}"                     |          |
|------------|--------------------------------------------------------|----------|
| dmenu-shut | cd ~/dmenu\ scripts/logout; ls |  dmenu -i -l 20 -p    |    p     |
|            | "Shutdown menu:"| xargs -I {} sh "{}"                  |          |
|------------|--------------------------------------------------------|----------|
| dmenu-shot | cd ~/dmenu\ scripts/screenshot; ls | dmenu -l 20 -p    |    r     |
|            | "Take Screenshot of:"| xargs -I {} sh "{}"             |          |
|------------|--------------------------------------------------------|----------|
| dmenu-web  | cd ~/dmenu\ scripts/web; ls | dmenu -l 20 -p           |    o     |
|            | "Choose search engine: "| xargs -I {} zsh "{}"         |          |
+---------------------------------------------------------------------+----------+
| dmenu-conf | cd ~/dmenu\ scripts/editconfig; ls | dmenu -l 20 -p    |    f     |
|            | "Edit config:"| xargs -I {} zsh "{}"                   |          |
+---------------------------------------------------------------------+----------+
| dmenu-todo | cd ~/dmenu\ scripts/todo/; ./script                    |    d     |
+---------------------------------------------------------------------+----------+
| dmenu-wall | cd ~/dmenu\ scripts/wallpaper; ./script                |    d     |
+---------------------------------------------------------------------+----------+
```

## My build of dmenu
If you dont want to compile dmenu yourself, you can grab my version of dmenu. <br>
My build of dmenu is the folder ```dmenu-4.9``` in the repo. To install it:
- Make sure you have cloned the repository and that ity is the active directory in the terminal.
- Run the commannd ```sudo make install```
Now, if you added keyblindings to open dmenu and the scripts - you should be able to open dmenu with ```cmd + shift + return```

## Installation of dmenu
### Clone the dmenu repo
Clone the dmenu repo with the following command: <br>
```wget https://dl.suckless.org/tools/dmenu-4.9.tar.gz && cd dmenu-4.9```

### Modify config.mk (Important! dmenu will not build otherwise)
- Delete all contents of config.mk
- Paste the following in config.mk:
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
- Make sure you are in the ```dmenu-4.9``` directory, and run ```sudo make install```
Now, if you added keyblindings to open dmenu and the scripts - you should be able to open dmenu with ```cmd + shift + return```
