#!/usr/bin/perl

open(PROCESS, "lscpu|");

while (defined(my $ligne = <PROCESS>))
{
	chomp($ligne);
	my @items = split(': +', $ligne);
	print "<tr> <td> <strong>$items[0]</strong> </td>";
	print "<td> $items[1] </td> </tr>\n";

}
