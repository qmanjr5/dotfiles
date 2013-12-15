#!/bin/bash
scrot $@ '%s_$wx$h.png' -e '~/dotfiles/bash/scripts/imgurbash.sh $f'
