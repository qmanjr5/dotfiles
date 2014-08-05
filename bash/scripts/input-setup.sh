#!/usr/bin/bash
synclient TapButton1=3
synclient TapButton2=1

xmodmap -e "pointer = 3 2 1"
