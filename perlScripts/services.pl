#!/usr/bin/perl

open(PROCESS, "chkconfig -l |");

while (defined(my $ligne = <PROCESS>))
{	
	chomp($ligne);
	@items = split(/ +/, $ligne);
	print "<tr style='padding: -10px;'><td>$items[0]</td><td>";
	
	print"<select name='$items[0]' id='flip-mini' data-role='slider'>";
	if ($ligne =~ m/on/)
	{
		print "<option selected='selected'>ON</option>";
		print "<option>OFF</option>";
	}
	else 
	{
		print "<option>ON</option>";
		print "<option selected='selected'>OFF</option>";
	}
	print "</td></tr>\n";
}
