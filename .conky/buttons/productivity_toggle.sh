#!/bin/sh

if [ ! -f ~/.productivity_timer ]
then
        touch ~/.productivity_timer
else
        rm ~/.productivity_timer
fi
