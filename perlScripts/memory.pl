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
		$pct = (($items[2]/$items[1])*100);
		$pct = sprintf("%.2f", $pct);
		print "$pct % used memory\n";
	}
	else
	{
		$ligne++;
	}
}
