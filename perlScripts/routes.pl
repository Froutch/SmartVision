#!/usr/bin/perl

open(PROCESS, "route -n|");

while (defined(my $ligne = <PROCESS>))
{
	chomp($ligne);
	my @items = split(' +', $ligne);
	print "<tr> <td> $items[0] </td>";
	print "<td> $items[1] </td>";
	print "<td> $items[2] </td>";
	print "<td> $items[7] </td> </tr> \n";

}
