#! /usr/bin/env sh
open -a Xquartz
cd ~/dmenu\ scripts/logout
ls \
| dmenu -i -l 20 -p "Shutdown menu:" \
| xargs -I {} sh "{}"
