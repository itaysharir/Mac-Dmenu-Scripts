#! /usr/bin/env sh

export DMENU="dmenu -i -l 20 -p"

### Options ###
choose () {
    export wall=$(cd ~/wallpapers/dt && feh --thumbnails --index-info '' --action 'printf "%%s\n" %F' "$PWD" * | rev | cut -c1- | rev)
    wal -i $wall
    echo $(cat ~/.cache/wal/wal) >> ~/dmenu\ scripts/.wallpaper_history
}

random () {
    export file=$(ls ~/wallpapers/dt | shuf -n 1)
    wal -i ~/wallpapers/dt/$file
    echo $(cat ~/.cache/wal/wal) >> ~/dmenu\ scripts/.wallpaper_history
}

apply () {
    export currentwall=$(osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')

    if [[ $(cat ~/dmenu\ scripts/themes/.current) == 1 ]]; then
        sed -i '' -e '$ d' ~/dmenu\ scripts/themes/Xmonad
        echo wal -i $currentwall >> ~/dmenu\ scripts/themes/Xmonad
    fi

    if [[ $(cat ~/dmenu\ scripts/themes/.current) == 2 ]]; then
        sed -i '' -e '$ d' ~/dmenu\ scripts/themes/Qtile
        echo wal -i $currentwall >> ~/dmenu\ scripts/themes/Qtile
    fi

    if [[ $(cat ~/dmenu\ scripts/themes/.current) == 3 ]]; then
        sed -i '' -e '$ d' ~/dmenu\ scripts/themes/qtile_reddit_rice
        echo wal -i $currentwall >> ~/dmenu\ scripts/themes/qtile_reddit_rice
    fi

    if [[ $(cat ~/dmenu\ scripts/themes/.current) == 4 ]]; then
        sed -i '' -e '$ d' ~/dmenu\ scripts/themes/Palenight
        echo wal -i $currentwall >> ~/dmenu\ scripts/themes/Palenight

    fi
}

undo () {
    export lastwall=$(sed 'x;$!d' < ~/dmenu\ scripts/.wallpaper_history)
    wal -i $lastwall
}

### Confirm ###
confirm () {
    choice=$(printf "Yes\nNo" | ${DMENU} "Do you like your new wallpaper?")
    if [[ $choice == "Yes" ]]; then
        exit
    fi
    if [[ $choice == "No" ]]; then
        undo
    fi
}

### Main menu ###
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
