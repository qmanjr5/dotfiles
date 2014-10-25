#!/usr/bin/bash
synclient TapButton1=1
synclient TapButton2=3

xmodmap -e "pointer = 1 2 3"
