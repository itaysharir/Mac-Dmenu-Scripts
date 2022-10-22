#! /usr/bin/env zsh

cd | dmenu -p "Search stackoverflow:" | xargs -I {} open "https://stackoverflow.com/search?q="{}""
