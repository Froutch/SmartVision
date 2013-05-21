#!/usr/bin/perl -w

use strict;

my @items = ("hrStorageSize.1");
foreach my $item (@items)
{
	my $request = `snmpget -v 1 -c smartvision 10.8.97.1 $item`;
	my @request = split (/ +/, $request);
	my $result = $request[3];
	print $result;
}
