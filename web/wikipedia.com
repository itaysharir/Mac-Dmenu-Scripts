#! /usr/bin/env sh

cd | dmenu -p "Search wikipedia:" | xargs -I {} open "https://en.wikipedia.org/wiki/"{}""
