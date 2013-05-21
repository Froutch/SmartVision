#!/usr/bin/perl -w

use strict;
use warnings;

my $ip = "10.8.97.1";

my $os_result = `xprobe2 -v $ip`;

my @os_tmp;



@os_tmp = split('Running OS: "', $os_result);

@os_tmp = split('"', $os_tmp[1]);

print $os_tmp[0];
