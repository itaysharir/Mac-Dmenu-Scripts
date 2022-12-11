#! /usr/bin/env sh

export DMENU="dmenu -i -l 20 -p"

# function for choosing a spacific wallpaper
choose () {
    wall=$(cd ~/wallpapers/dt && /opt/local/bin/sxiv -r -q -t -b -o *)
    wal -i $wall
    echo $(cat ~/.cache/wal/wal) >> ~/dmenu\ scripts/.wallpaper_history
}

# function for choosing a random wallpaper
random () {
    export file=$(ls ~/wallpapers/dt | shuf -n 1)
    wal -i ~/wallpapers/dt/$file
    echo $(cat ~/.cache/wal/wal) >> ~/dmenu\ scripts/.wallpaper_history
}

# funcion for applying the current wallpaper to your current rice
apply () {
    export currentwall=$(osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')

    if [[ $(cat ~/dmenu\ scripts/themes/current) == 1 ]]; then
        echo $currentwall > ~/dmenu\ scripts/themes/wallpapers/dt-xmonad
    fi

    if [[ $(cat ~/dmenu\ scripts/themes/current) == 2 ]]; then
        echo $currentwall > ~/dmenu\ scripts/themes/wallpapers/dt-qtile
    fi

    if [[ $(cat ~/dmenu\ scripts/themes/current) == 3 ]]; then
        echo $currentwall > ~/dmenu\ scripts/themes/wallpapers/huh-qtile
    fi

    if [[ $(cat ~/dmenu\ scripts/themes/current) == 4 ]]; then
        echo $currentwall > ~/dmenu\ scripts/themes/wallpapers/palenight
    fi
}

# a function to undo setting a wallpaper
undo () {
    export lastwall=$(sed 'x;$!d' < ~/dmenu\ scripts/.wallpaper_history)
    wal -i $lastwall
}

# a function to confirm setting the wallpaper
confirm () {
    choice=$(printf "Yes\nNo\nNo, Give me another random wallpaper" | ${DMENU} "Do you like your new wallpaper?")
    if [[ $choice == "Yes" ]]; then
        exit
    fi

    if [[ $choice == "No" ]]; then
        undo
    fi

    if [[ $choice == "No, Give me another random wallpaper" ]]; then
        random
        confirm
    fi
}

# list all options
main () {
    choice=$(printf "Choose\nRandom\nApply\nUndo" | ${DMENU} "What would you like to do?")

    if [[ $choice == "Choose" ]]; then
        choose
    fi

    if [[ $choice == "Random" ]]; then
        random
        confirm
    fi

    if [[ $choice == "Apply" ]]; then
        apply
    fi

    if [[ $choice == "Undo" ]]; then
        undo
        confirm
    fi
}

main
