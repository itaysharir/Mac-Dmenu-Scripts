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
    backup=$(printf "Yes\nNo" | ${DMENU} "Backup existing configs?") # ask me if i want to backup the current configs

    if [ $backup == "Yes" ]; then # if i said yes, do the following:
        mv ~/.config/sketchybar ~/.config/sketchybar.old # move sketchybar config to sketchybar.old
        mv ~/.config/nvim ~/.config/nvim.old             # move nvim config to nvim.old
        mv ~/.config/alacritty ~/.config/alacritty.old   # move alacritty config to alacritty.old
        mv ~/.config/yabai ~/.config/yabai.old           # move yabai config to yabai.old
    fi

    # remove current configs
    rm -r ~/.config/sketchybar  # sketchybar
    rm -r ~/.config/nvim/       # nvim
    rm -r ~/.config/alacritty/  # alacritty
    rm -r ~/.config/yabai/      # yabai

    # if a theme that uses nvim with the onedark colorscheme is selected, use that colorscheme
    if [ $choice == "dt-xmonad" ] || [ $choice == "dt-qtile" ] || [ $choice == "huh-qtile"]; then
        cp -r /Users/itaysharir/dmenu\ scripts/themes/nvim/nvim-onedark ~/.config/nvim
    fi

    # if a theme that uses nvim with the palenight colorscheme is selected, use that colorscheme
    if [ $choice == "palenight" ]; then
        cp -r /Users/itaysharir/dmenu\ scripts/themes/nvim/nvim-palenight ~/.config/nvim
    fi

    # move desired configs to ~/.config
    cp -r ~/dmenu\ scripts/themes/sketchybar/sketchybar-$choice ~/.config/sketchybar    # sketchybar
    cp -r ~/dmenu\ scripts/themes/yabai/yabai-$choice ~/.config/yabai                   # yabai
    cp -r ~/dmenu\ scripts/themes/alacritty/alacritty-$choice ~/.config/alacritty       # alacritty

    # restart services
    # if theme is palenight, stop sketchybar instead of restart (because this theme has no bar)
    if [ $choice == "palenight" ]; then
        brew services stop sketchybar
    else
        brew services restart sketchybar
    fi

    brew services restart yabai # restart yabai

    # write the theme's number to a text file for other scripts to use
    if [ $choice == "dt-xmonad" ]; then
        echo 1 > /Users/itaysharir/dmenu\ scripts/themes/current
    elif [ $choice == "dt-qtile" ]; then
        echo 2 > /Users/itaysharir/dmenu\ scripts/themes/current
    elif [ $choice == "huh-qtile" ]; then
        echo 3 > /Users/itaysharir/dmenu\ scripts/themes/current
    elif [ $choice == "palenight" ]; then
        echo 4 > /Users/itaysharir/dmenu\ scripts/themes/current
    fi

    # set wallpaper
    export wall=$(cat ~/dmenu\ scripts/themes/wallpapers/$choice) # see what is the applied wallpaper for the selected theme and save it in a variable
    wal -i $wall # set the wallpaper saved in the "wall" variable
fi
