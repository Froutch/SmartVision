#!/bin/bash

#date de la mise a jour des paquets

ls -lt --time-style="long-iso" /var/log/apt | grep -o '\([0-9]\{2,4\}[- ]\)\{3\}[0-9]\{2\}:[0-9]\{2\}' -m 1
