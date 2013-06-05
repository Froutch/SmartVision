#!/usr/bin/perl

open(PROCESS, "lscpu|");

while (defined(my $ligne = <PROCESS>))
{
	chomp($ligne);
	my @items = split(': +', $ligne);
	print "<tr> <td> $items[0] </td>";
	print "<td> $items[1] </td> </tr>\n";

}
