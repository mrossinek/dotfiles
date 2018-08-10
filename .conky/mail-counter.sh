#!/bin/sh
find ~/.mail -type d -name "new" -exec sh -c '
        for dir do
                if echo $dir | grep -viq "trash\|del\|draft"; then
                        count=$(( $count + $(ls -l "$dir" | egrep -c '^-') ))
                fi
        done
        echo $count
' sh {} +
