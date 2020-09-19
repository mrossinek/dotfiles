#!/bin/sh
tracking=$(timew > /dev/null; echo $?)
if [ ${tracking} -ne 0 ]; then
    echo "#00ff00"
else
    echo "#ff0000"
fi
