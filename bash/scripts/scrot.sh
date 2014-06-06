#!/bin/bash
scrot $@ '%s_$wx$h.png' -e '~/dots/bash/scripts/imgurbash.sh $f'
