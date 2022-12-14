#! /usr/bin/env sh

DMENU="dmenu -i -l 20 -p"

# function to list all options
main () {
    choice=$(printf "Lock Screen\nLogout\nReboot\nShutdown" | ${DMENU} "Shutdown menu:")
}

if [[ $choice == "Lock Screen" ]]; then
    osascript -e 'tell application "Finder" to sleep'
fi

if [[ $choice == "Logout" ]]; then
    skhd -k "cmd + shift - q"
fi

if [[ $choice == "Reboot" ]]; then
    osascript -e 'tell app "System Events" to restart'
fi

if [[ $choice == "Shutdown" ]]; then
    osascript -e 'tell app "System Events" to shut down'
fi

main
