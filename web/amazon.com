#! /usr/bin/env sh

cd | dmenu -p "Search amazon:" | xargs -I {} open "https://www.amazon.com/s?k="{}""
