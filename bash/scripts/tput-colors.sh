#!/bin/bash

for foo in {0..16..1} 
do
	tput setaf $foo
	echo $foo
done
