#!/usr/bin/perl

# Script reporting TCP connections and their number

my $grep_string = $ARGV[0];

chomp $grep_string;

if ($grep_string eq '')
{
	open(TCP, "netstat -n | grep tcp | ");
	open(NB_TCP, "netstat -n | grep -c tcp | ");
}
else
{
	open(TCP, "netstat -n | grep tcp | grep $grep_string |)");
	open(NB_TCP, "netstat -n | grep -c tcp | grep $grep_string |)");
}

while (defined(my $output = <TCP>))
{
	chomp ($output);
	print "$output \n";
}

close (TCP);

$output2 = <NB_TCP>;
chomp ($output2);
print "Nombre de connexions TCP : $output2 \n";
