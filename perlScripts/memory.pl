#!/usr/bin/perl

open(PROCESS, "free -m|");

while (defined(my $ligne = <PROCESS>))
{
	if ($ligne =~ m/Mem/)
        {	
		chomp($ligne);
             	my @items = split(' +', $ligne);
		print "$items[1] Mo ";
        }

	if ($ligne =~ m/buffers/)
	{
		chomp($ligne);
		print "$items[3]/ \n";
	}

	else
	{
		$ligne++;
	}
	#$pct = (($items[2]/$items[1])*100);
	#$pct = sprintf("%.2f", $pct);
	#print "($pct % used)";
	
}
