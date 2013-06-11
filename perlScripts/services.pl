#!/usr/bin/perl

open(PROCESS, "chkconfig -l |");

while (defined(my $ligne = <PROCESS>))
{	
	chomp($ligne);
	@items = split(/ +/, $ligne);
	if ($ligne =~ m/on/)
	{
		print "$items[0] : ON \n";
	}
	else 
	{
		print "$items[0] : OFF \n";
	}
}
