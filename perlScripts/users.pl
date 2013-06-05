#!/usr/bin/perl

# Script reporting users

open(USERS, "who -q |");

while (defined(my $output = <USERS>))
{
	chomp($output);
	print "$output \n";
}

close(USERS);
