#!/usr/bin/perl

open(PROCESS, "swapon -s|");

while (defined(my $ligne = <PROCESS>))
{
	chomp($ligne);
	my @items = split(' ', $ligne);
	print "<tr> <td> $items[0] </td> \n";
	#print "<td> $items[1] </td>";
	#print "<td> $items[2] </td> </tr> \n";

}
