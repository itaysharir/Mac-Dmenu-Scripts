#! /usr/bin/env sh
open -a Xquartz
cd ~/dmenu\ scripts/themes
ls \
| dmenu -i -l 20 -p "Change Bar:"| \
xargs -I {} sh "{}"
