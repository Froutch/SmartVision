#!/bin/bash

top -b -n 1 | sed -ne '/Cpu/ s/.* \([0-9]*\.[0-9]*\)%us.* \([0-9]*\.[0-9]*\)%sy.*/User: \1%, System: \2%/p';
