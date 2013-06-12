#!/usr/bin/perl

open(PROCESS, "uptime |");

while (defined(my $ligne = <PROCESS>))
{
	chomp($ligne);
	my @items = split(' +', $ligne);
	if ($ligne =~ m/up/)
	{
		print "Systeme allume depuis $items[3] \n";
	}
	else
	{
		print "Systeme eteint \n";
	}
}
