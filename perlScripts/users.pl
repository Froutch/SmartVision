#!/usr/bin/perl


# Script reporting users
my @tmp;


open(USERS, "who |");

while (defined(my $output = <USERS>))
{
	
	chomp($output);
	@tmp  = split(" ", $output);
	print "<tr><td>$tmp[0] $tmp[1]<td>$tmp[2] $tmp[3]</td><td>$tmp[4]</td></tr>\n";
}

close(USERS);
