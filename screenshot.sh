#! /usr/bin/env sh

export DMENU="dmenu -i -l 20 -p"
export SCREENSHOTPATH="/Users/$(whoami)/Desktop/" # with a / at the end
export SCREENSHOTNAME="screenshot"
export SCREENSHOTFORMAT="png" # without .

# list options
choice=$(printf \
         "Fullscreen\\
Reigon\\
"\
| sed 's/\\//' | ${DMENU} "Search:") # pipe configs into dmenu

if [ $choice == "Fullscreen" ]; then
    screencapture ${SCREENSHOTPATH}${SCREENSHOTNAME}.${SCREENSHOTFORMAT}
fi

if [ $choice == "Reigon" ]; then
    screencapture -i ${SCREENSHOTPATH}${SCREENSHOTNAME}.${SCREENSHOTFORMAT}
fi
