#! /usr/bin/env zsh

cd | dmenu -p "Search google:" | xargs -I {} open "https://www.google.com/search?client=firefox-b-d&q="{}""
