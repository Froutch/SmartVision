#!/usr/bin/perl -w

use strict;
use warnings;
my @arp_scan_line;
my @arp_scan_line2;
my $arp_scan = `arp-scan -l`;
my $i = 0;
my $j;
my @tmp;

@arp_scan_line = split("\n", $arp_scan);

foreach $j (@arp_scan_line) 
{
	print $j;
	print "\n";
}
