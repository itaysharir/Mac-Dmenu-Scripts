#!/usr/bin/env sh

TOPPROC=$(top -l  2 | grep -E "^CPU" | tail -1 | awk '{ print $3 + $5"%" }'
)

sketchybar --set $NAME label="cpu ($TOPPROC)"
