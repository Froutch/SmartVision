#!/usr/bin/perl -w

use warnings;
use strict;

my $phrase = $ARGV[0];

system `echo "$phrase"  >>  /var/www/guigui/perlScripts/result.txt`;
