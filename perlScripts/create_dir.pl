#!/usr/bin/perl -w

use strict;
use warnings;

system ("sudo echo \"$ARGV[1]\" > $ARGV[0]");