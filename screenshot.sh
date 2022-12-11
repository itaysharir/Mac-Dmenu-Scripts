#! /usr/bin/env sh

export DMENU="dmenu -i -l 20 -p"
export SCREENSHOTPATH="/Users/$(whoami)/Desktop/" # with a / at the end
export SCREENSHOTNAME="screenshot"
export SCREENSHOTFORMAT="png" # without .

# list options
choice=$(printf \
         "Fullscreen\\
Fullscreen (copy)\\
Selected Reigon\\
Selected Reigon (copy)\
"\
| sed 's/\\//' | ${DMENU} "Search:") # pipe configs into dmenu

if [ $choice == "Fullscreen" ]; then
    screencapture ${SCREENSHOTPATH}${SCREENSHOTNAME}.${SCREENSHOTFORMAT}
fi

if [ $choice == "Fullscreen (copy)" ]; then
    screencapture -c
fi

if [ $choice == ["Selected Reigon"] ; then
    screencapture -i ${SCREENSHOTPATH}${SCREENSHOTNAME}.${SCREENSHOTFORMAT}
fi

if [ $choice == "Selected Reigon (copy)" ]; then
    screencapture -i -c
fi
