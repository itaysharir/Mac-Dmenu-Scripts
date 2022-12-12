#! /usr/bin/env sh

export DMENU="dmenu -i -l 20 -p"

# list options
choice=$(printf \
         "dt-xmonad\\
dt-qtile\\
palenight\\
huh-qtile\\
"\
| sed 's/\\//' | ${DMENU} "Select theme:") # pipe options into dmenu

# if choice is empty, DO NOT PROCEED
if [ -z $choice ]; then
    exit
else # if choice is not empty, do the following:
    # remove current configs
    rm -r ~/.config/sketchybar  # sketchybar
    rm -r ~/.config/nvim/       # nvim
    rm -r ~/.config/alacritty/  # alacritty
    rm -r ~/.config/yabai/      # yabai

    # if setups that need nvim with onedark colorscheme are selected, use that colorscheme
    if [ $choice == "dt-xmonad" ] || [ $choice == "dt-qtile" ] || [ $choice == "huh-qtile"]; then
    cp -r /Users/itaysharir/dmenu\ scripts/themes/nvim/nvim-onedark ~/.config/nvim
    fi

    if [ $choice == "palenight" ]; then
    cp -r /Users/itaysharir/dmenu\ scripts/themes/nvim/nvim-palenight ~/.config/nvim
    fi

    # make sure yabai folder exists
    mkdir ~/.config/yabai

    # move desired configs to ~/.config
    cp -r ~/dmenu\ scripts/themes/sketchybar/sketchybar-$choice ~/.config/sketchybar    # sketchybar
    cp -r ~/dmenu\ scripts/themes/yabai/yabai-$choice/yabairc ~/.config/yabai/yabairc   # yabai
    cp -r ~/dmenu\ scripts/themes/alacritty/alacritty-$choice ~/.config/alacritty       # alacritty

    # restart services
    # if theme is palenight, stop sketchybar instead of restart
    if [ $choice == "palenight" ]; then
        brew services stop sketchybar
    else
        brew services restart sketchybar
    fi

    brew services restart yabai # restart yabai

    # write the theme's number to a text file for other scripts to use
    if [ $choice == "dt-xmonad" ]; then
        echo 1 > /Users/itaysharir/dmenu\ scripts/themes/current
    fi

    if [ $choice == "dt-qtile" ]; then
        echo 2 > /Users/itaysharir/dmenu\ scripts/themes/current
    fi

    if [ $choice == "huh-qtile" ]; then
        echo 3 > /Users/itaysharir/dmenu\ scripts/themes/current
    fi

    if [ $choice == "palenight" ]; then
        echo 4 > /Users/itaysharir/dmenu\ scripts/themes/current
    fi

    # set wallpaper
    export wall=$(cat ~/dmenu\ scripts/themes/wallpapers/$choice)
    wal -i $wall
fi
