#!/bin/bash
clear
while true
do
	echo -e "Up"
	VBoxManage list runningvms
	echo -e "Down"
	VBoxManage list vms
	sleep 10m
	clear
done
