#!/usr/bin/perl

open(PROCESS, "netstat -i |");

while (defined(my $ligne = <PROCESS>))
{
	chomp($ligne);
	my @items = split(' +', $ligne);
	print "$items[0] \t $items[1] \n";
}
