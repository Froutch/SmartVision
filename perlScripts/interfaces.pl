#!/usr/bin/perl

open(PROCESS, "netstat -i |");

while (defined(my $ligne = <PROCESS>))
{
	chomp($ligne);
	my @items = split(' +', $ligne);
	print "<tr><td>$items[0]</td><td>$items[1]</td></tr>\n";
}
