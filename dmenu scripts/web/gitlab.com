#! /usr/bin/env zsh

cd | dmenu -p "Search gitlab:" | xargs -I {} open "https://gitlab.com/search?search="{}""
