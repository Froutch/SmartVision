#!/usr/bin/perl

open(PROCESS, "uptime |");

while (defined(my $ligne = <PROCESS>))
{
	chomp($ligne);
	if ($ligne =~ m/up/)
	{	
		my @times = split(',', $ligne);
		my @dates = split('up +', $times[0]);
		print $dates[1];
	}
	else
	{
		print "Systeme eteint \n";
	}
}
