#! /usr/bin/env zsh

cd | dmenu -p "Search github:" | xargs -I {} open "https://github.com/search?q="{}""
