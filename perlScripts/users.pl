#!/usr/bin/perl

# Script reporting users

my $grep_string = $ARGV[0];

chomp $grep_string;

if ($grep_string eq '') {
	open(NB_USERS, "who | grep -c : |");
	open(USERS, "who | grep : |");
}else{
	open(NB_USERS, "who | grep : | grep -c $grep_string |");
	open(USERS, "who | grep : | grep $grep_string |");
}

while (defined(my $output = <USERS>))
{
	chomp($output);
	print "$output \n";
}

close(USERS);

$output2 = <NB_USERS>;
chomp($output2);
print "Nombre d'utilisateurs : $output2 \n";
