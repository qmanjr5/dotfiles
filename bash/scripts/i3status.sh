#!/bin/bash
i3status | while :
do
    read line
    echo -n "$(t n 2>&1) | $line" || exit 1
done
