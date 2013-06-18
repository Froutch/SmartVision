#!/usr/bin/perl

open(PROCESS, "free -m|");

while (defined(my $ligne = <PROCESS>))
{
	if ($ligne =~ m/Mem/)
	{
		chomp($ligne);
		my @items = split(' +', $ligne);
		print "$items[2]/";
		print "$items[1] Mo ";
		$pct = (($items[2]/$items[1])*100);
		$pct = sprintf("%.2f", $pct);
		print "($pct % used)";
	}
	else
	{
		$ligne++;
	}
}
