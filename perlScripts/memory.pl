#!/usr/bin/perl

open(PROCESS, "free -m|");

while (defined(my $ligne = <PROCESS>))
{
	if ($ligne =~ m/Mem/)
	{
		chomp($ligne);
		my @cats = split(' +', $ligne);
		$total = $cats[1];
	}		
	elsif ($ligne =~ m/buffers\/cache/)
	{
		chomp($ligne);
		my @items = split(' +', $ligne);
		$used = $items[2];
	}
}

print "$used/$total Mo ";
$pct=(($used/$total)*100);
$pct = sprintf("%.2f", $pct);
print "($pct % used)";
