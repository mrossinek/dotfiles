#!/bin/sh

# run this script after fetching new mail to update unread mail count

typeset -i prev=$(cat ~/.mailcount)

find ~/.mail -type d -name "new" -exec sh -c '
        for dir do
                if echo $dir | grep -viq "trash\|del\|draft"; then
                        count=$(( $count + $(ls -l "$dir" | egrep -c '^-') ))
                fi
        done
        echo $count
' sh {} + > ~/.mailcount

typeset -i next=$(cat ~/.mailcount)

new=$(( $next - $prev ))

if [ $next -gt $prev ]; then
        notify-send -u low "Mail" "$new new mails"
fi

