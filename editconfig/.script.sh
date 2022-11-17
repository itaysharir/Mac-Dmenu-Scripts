#! /usr/bin/env sh
open -a Xquartz
cd ~/dmenu\ scripts/editconfig
ls \
| dmenu -l 15 -p "Edit config:" \
| xargs -I {} zsh "{}"
