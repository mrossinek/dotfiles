#!/bin/sh

# run this script after fetching news to update unread news count

typeset -i prev=$(cat ~/.newscount)

newsboat -x print-unread | sed 's/[^0-9]//g' > ~/.newscount

typeset -i next=$(cat ~/.newscount)

new=$(( $next - $prev ))

if [ $next -gt $prev ]; then
        notify-send -u low "News" "$new new news"
fi

