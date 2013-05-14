#!/usr/bin/perl -w

use strict;

my $item = "hrStorageSize.1";

my $request = `snmpget -IR -v 1 -c public 10.8.97.1 $item`;
my @request = split (/ +/, $request);
my $result = $request[3];
