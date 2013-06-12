#!/usr/bin/perl

open(PROCESS, "swapon -s|");

while (defined(my $ligne = <PROCESS>))
{
	chomp($ligne);
	my @items = split('\t', $ligne);
	print "$items[0] \n";
	print "$items[1] \n";
	#print "<td> $items[1] </td>";
	#print "<td> $items[2] </td> </tr> \n";

}
