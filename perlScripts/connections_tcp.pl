#!/usr/bin/perl

# Script reporting TCP connections and their number

my $grep_string = $ARGV[0];
my @result;

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
	print "<tr>\n";
	chomp ($output);
	@result = split(" +", $output);
	print "<td>$result[0]</td><td>$result[1]</td><td>$result[2]</td>";
	print "<td>$result[3]</td><td>$result[4]</td><td>$result[5]</td>\n";
	print"</tr>\n\n";
}

close (TCP);

$output2 = <NB_TCP>;
chomp ($output2);
print "<strong>Number of TCP connections : $output2</strong> \n";
