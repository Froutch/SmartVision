#!/usr/bin/perl

# Script permettant de determiner le nombre de connexions TCP ouvertes

my $grep_string = $ARGV[0];

chomp $grep_string;

if ($grep_string eq '')
{
	open(NB_TCP, "netstat -n | grep -c tcp | ");
}
else
{
	open(NB_TCP, "netstat -n | grep tcp | grep -c $grep_string |)");
}

$output = <NB_TCP>;
close (NB_TCP);
chomp ($output);
print "$output \n";
