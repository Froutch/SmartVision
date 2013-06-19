#!/usr/bin/perl

open(PROCESS, "chkconfig -l |");

my $i = 0;

while (defined(my $ligne = <PROCESS>))
{	
	chomp($ligne);
	@items = split(/ +/, $ligne);
	print "<tr><td style='width:90%;'><strong>$items[0]</strong></td><td>";
	if ($ligne =~ m/on/)
	{
		print'<a rel="external" href="index.php?page=services&host=localhost&service=';
		print $items[0];
		print'&value=0" data-theme="b" data-role="button" data-inline="true">ON</a>';	
	}
	else 
	{
		print'<a rel="external" href="index.php?page=services&host=localhost&service=';
		print $items[0];
		print'&value=1" data-theme="d" data-role="button" data-inline="true">OFF</a>'; 
	}
	print "</td></tr>\n";
	$i++;
}
