#!/bin/bash

rm index.html
rm *.png
rm *.jpg

wget https://www.reddit.com/r/memes/top/
touch jaj | grep 'alt="Post image"' index.html | head -n 2 | grep 'src' > jaj
touch joj
grep -m 1 -oP '(?<=src=").*?(?=" style)' jaj  | head -1 > joj
touch jij
sed 's/amp;//g' joj > jij
cat joj
cat  jij
wget -i jij
nameImg=$(find . -type f -name '*.png*' -o -name '*.jpg*')
steak=$(readlink -f $nameImg)

gsettings set org.gnome.desktop.background picture-uri $steak
gsettings set org.gnome.desktop.background picture-options "scaled"