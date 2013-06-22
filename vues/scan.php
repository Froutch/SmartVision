<?php
if(!empty($_GET['scan']))
{
	system('sudo perlScripts/portScan.pl');
}
?>
<?php
if(isset($_GET['del']))
{
	$query2 ='DELETE FROM machines WHERE ip="'.$_GET['ip'].'"';
	if(!mysql_query($query2)) echo "<center><a href='' data-role='button' data-theme='e' data-inline='true' data-transition='pop'> La requête n'a pas abouti<br />".htmlentities($query2)."<br />".mysql_error()." </a></center>";
	else echo "<center><a href='' data-role='button' data-theme='e' data-inline='true' data-transition='pop'> The host was succesfully deleted </a></center>";
}
?>
<center><a href="index.php?page=scan&scan=1" data-theme="a" data-role="button">Scan Update (depending of the size of your Network)</a></center>
<table cellpadding="2" style="font-size: 0.8em; position:relative; margin : 0 auto;">
	<tr>
		<td><strong>IP</strong></td>
		<td><strong>Manufacturer</strong></td>
		<td><strong>OS</strong></td>
		<td><strong>Ports</strong></td>
		<td><strong>Administration</strong></td>
	</tr>
<?php
$file = "scan.xml";
$xmlstr = simplexml_load_file($file);
foreach ($xmlstr as $machine)
{
	echo "<div><tr>";
	echo "<td>".$machine->ip."</td>";
	echo "<td>".$machine->const."</td>";
	echo "<td>".$machine->os."</td>";
	echo "<td>".$machine->ports."</td>";
	
	$query ='SELECT * FROM machines';
	$result = mysql_query($query);
	while($data = mysql_fetch_array($result))
	{
		if($data['ip'] == $machine->ip) echo '<td><a style="padding: 0px; color:red;" href="index.php?page=scan&del=1&ip='.$machine->ip.'" data-theme="b" data-role="button" data-inline="true">Del</a>';
		else echo '<td><a style="padding: 0px;" href="index.php?page=log&ip='.$machine->ip.'" data-theme="b" data-role="button" data-inline="true">Add</a>';
	} 
	if(mysql_num_rows($result) == 0) echo '<td><a style="padding: 0px;" href="index.php?page=log&ip='.$machine->ip.'" data-theme="b" data-role="button" data-inline="true">Add</a>';
	
	echo"</td>";
	echo "</tr></div>";
}
?>
</table>
