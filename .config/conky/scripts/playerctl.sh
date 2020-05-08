#!/bin/bash

# find currently active player
while read -r line
do
    case "$line" in
        Playing*)
            read -ra words <<< "$line"
            playerName="${words[1]}"
        ;;
    esac
done < <(playerctl -f "{{status}} {{playerName}}" -a status 2>/dev/null)

case "$playerName" in
    mpd)
        file=$(playerctl -p mpd metadata mpris:artUrl | sed "s;file://;;")
    ;;
    spotify)
        file="/usr/share/icons/hicolor/256x256/apps/spotify.png"
    ;;
    chromium*)
        file="/usr/share/icons/hicolor/256x256/apps/qutebrowser.png"
    ;;
esac
if ! cmp "$file" "/tmp/conky.cover" >/dev/null 2>&1
then
    cp "$file" "/tmp/conky.cover"
    convert "/tmp/conky.cover" "/tmp/conky.cover.png"
fi

# return queried field
playerctl -p "$playerName" metadata -f '{{artist}}\\{{title}}' > ~/.playerctl_status
sed -i 's/\\\\/\n/g' ~/.playerctl_status
