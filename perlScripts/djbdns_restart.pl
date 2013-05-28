#!/usr/bin/perl -w

use strict;
use warnings;

system ("sudo $ARGV[1] > $ARGV[0]");
