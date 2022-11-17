#! /usr/bin/env zsh

cd | dmenu -p "Search reddit:" | xargs -I {} open "https://www.reddit.com/search/?q="{}""
