#! /usr/bin/env sh
open -a Xquartz
cd ~/dmenu\ scripts/screenshot
ls \
| dmenu -l 20 -p "Take Screenshot of:" \
| xargs -I {} sh "{}" \
