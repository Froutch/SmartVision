#!/usr/bin/perl -w

use strict;
use warnings;

system ("sudo touch $ARGV[0]");

system ("sudo echo \"$ARGV[1]\" > $ARGV[0]");

system ("sudo rm $ARGV[2]");

system ("sudo cp $ARGV[0] $ARGV[2]");
