#!/bin/bash

shopt -s extglob
rm -v !("dailyMemes.sh")

wget https://www.reddit.com/r/memes/top/
touch startIndex | grep 'alt="Post image"' index.html | head -n 2 | grep 'src' > startIndex
touch unformattedLink | grep -m 1 -oP '(?<=src=").*?(?=" style)' startIndex  | head -1 > unformattedLink
touch formattedLink | sed 's/amp;//g' unformattedLink > formattedLink
wget -i formattedLink
nameImg=$(find . -type f -name '*.png*' -o -name '*.jpg*')
realpathImg=$(readlink -f $nameImg)

gsettings set org.gnome.desktop.background picture-uri $realpathImg
gsettings set org.gnome.desktop.background picture-options "scaled"