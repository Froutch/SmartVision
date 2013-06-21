#!/usr/bin/perl

open(PROCESS, "netstat -antp |");

while (defined(my $ligne = <PROCESS>))
{
	chomp($ligne);
	my @items = split(' +', $ligne);
	my @services = split('/', $items[6]);
	print "$services[1] \n";

}
