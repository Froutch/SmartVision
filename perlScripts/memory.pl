#!/usr/bin/perl

open(PROCESS, "free -m|");

while (defined(my $ligne = <PROCESS>))
{
	if ($ligne =~ m/Mem/)
	{
		chomp($ligne);
		my @items = split(' +', $ligne);
		print "Total : $items[1] Mo\n";
		print "Used : $items[2] Mo\n";
		print "Free : $items[3] Mo\n";
	}
	else
	{
		$ligne++;
	}
}
