<?php
if(!empty($_GET['scan']))
{
	system('sudo perlScripts/portScan.pl');
}
?>
<center><a href="index.php?page=scan&scan=1" data-theme="a" data-role="button">Scan Update (depending of the size of your Network)</a></center>
<table cellpadding="2" style="font-size: 0.8em;">
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
	echo "<tr>";
	echo "<td>".$machine->ip."</td>";
	echo "<td>".$machine->const."</td>";
	echo "<td>".$machine->os."</td>";
	echo "<td>".$machine->ports."</td>";
	echo '<td><a style="padding: 0px;" href="index.php?page=log&ip='.$machine->ip.'" data-theme="b" data-role="button" data-inline="true">Add</a>';
	echo"</td>";
	echo "</tr>";
}
?>
</table>
