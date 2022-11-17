#! /usr/bin/env zsh

cd | dmenu -p "Search youtube:" | xargs -I {} open "https://www.youtube.com/results?search_query="{}""
