#!/usr/bin/bash
echo "\033]0;Float\007";
echo "Mounting media drive 1..."
sudo mount "/dev/disk/by-label/Media\x20Drive\x201" /home/kairos/mountpoints/media1 || ( echo "Failed to mount media drive 1..."; exit $?; )
echo "Mounting media drive 2..."
sudo mount "/dev/disk/by-label/Media\x20Drive\x202" /home/kairos/mountpoints/media2 || ( echo "Failed to mount media drive 2..."; exit $?; )

