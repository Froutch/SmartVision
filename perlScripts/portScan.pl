#!/usr/bin/perl -w

use strict;
use warnings;
my @arp_scan_line;
my @arp_scan_line2;
my @arp_scan_ip;
my @arp_scan_mac;
my @arp_scan_const;
my $arp_scan = `arp-scan -l`;
my $i = 0;
my $j;
my @tmp;

@arp_scan_line = split("\n", $arp_scan);
shift(@arp_scan_line);
shift(@arp_scan_line);
pop(@arp_scan_line);
pop(@arp_scan_line);
pop(@arp_scan_line);

foreach $j (@arp_scan_line) 
{
	@arp_scan_line2 = split("\t", $j);
	$arp_scan_ip[$i] = $arp_scan_line2[0];
	$arp_scan_mac[$i] = $arp_scan_line2[1];
	$arp_scan_const[$i] = $arp_scan_line2[2];
	print $arp_scan_ip[$i];
	print "\t";
	print $arp_scan_mac[$i];
	print "\t";
	print $arp_scan_const[$i];
	print "\n";
	$i++;
}
foreach $j (@arp_scan_ip)
{
	print $j;
	print "\n";
	print `./ports.py $j`;
	print "\n\n";
}
