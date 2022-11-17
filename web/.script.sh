#! /usr/bin/env sh
open -a Xquartz
cd ~/dmenu\ scripts/web
ls \
| dmenu -l 20 -p "Choose search engine: " \
| xargs -I {} zsh "{}"
