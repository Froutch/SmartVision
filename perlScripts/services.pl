#!/usr/bin/perl

open(PROCESS, "chkconfig -l |");

while (defined(my $ligne = <PROCESS>))
{	
	chomp($ligne);
	@items = split(/ +/, $ligne);
	print "<tr><td style='width:90%;'><strong>$items[0]</strong></td><td>";
	
	print"<select name='$items[0]' id='flip-1' data-role='slider'>";
	if ($ligne =~ m/on/)
	{
		print "<option>OFF</option>";
		print "<option selected='selected'>ON</option>";
	}
	else 
	{
		print "<option selected='selected'>OFF</option>";
		print "<option>ON</option>";
	}
	print"</select>";
	print "</td></tr>\n";
}
