#!/bin/sh
current_status=$(timew)

if [ "$current_status" == "There is no active time tracking." ]; then
        timew continue
else
        timew stop
fi
