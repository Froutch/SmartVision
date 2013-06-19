#!/usr/bin/perl -w

#-------- Script Perl par Sabrina Mustafic --------

use strict;

my $line;
my @logs;
my @dates;
my %count;
my $date;
my @tab;
my $tab;

if (open (FD, "/var/log/apache2/access.log"))
{
	while ($line = <FD>)
	{
		$line =~ s/Jan/01/g;
		$line =~ s/Feb/02/g;
		$line =~ s/Mar/03/g;
		$line =~ s/Apr/04/g;
		$line =~ s/May/05/g;
		$line =~ s/Jun/06/g;
		$line =~ s/Jul/07/g;
		$line =~ s/Aug/08/g;
		$line =~ s/Sep/09/g;
		$line =~ s/Oct/10/g;
		$line =~ s/Nov/11/g;
		$line =~ s/Dec/12/g;

		chomp($line);

		@logs = split (/^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ .*\[([0-9][0-9].*):.*\]/, $line);

		@dates = split(/\n/, $logs[1]);

		foreach $date (@dates)
		{
			$date =~ s/:/\//g;
			@tab = split(/\//, $date);
			$date = $tab[2]."/".$tab[0]."/".$tab[1]." : ".$tab[3].":".$tab[4];

			if (exists $count{$date})
			{
				$count{$date} = $count{$date} +1;
			}
			else
			{
				$count{$date} = 1;
			}
		}
	}
}
foreach $date (sort keys %count)
{
	print "$date : $count{$date} hits\n";
}


