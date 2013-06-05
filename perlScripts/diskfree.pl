#!/usr/bin/perl

open(PROCESS, "df|");

while (defined(my $ligne = <PROCESS>))
{
	chomp($ligne);
	my @items = split(' +', $ligne);
	print "<tr> <td> $items[5] </td>";
	print "<td> $items[1] </td>";
	print "<td> $items[4] </td> </tr> \n";

}
