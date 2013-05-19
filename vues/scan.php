<table cellpadding="5">
	<tr>
		<td><strong>IP</strong></td>
		<td><strong>Constructeur</strong></td>
		<td><strong>OS</strong></td>
		<td><strong>Ports</strong></td>
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
	echo "</tr>";
}
?>
</table>
