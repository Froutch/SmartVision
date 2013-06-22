#!/bin/bash

for ligne in "$(free -m)"; 
do 
	echo "${ligne}"; 
	cut -d " " -f2;
done





