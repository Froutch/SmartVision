

<?php
if ($host == 'localhost')
{
	echo '<a href="index.php?page=terminal" data-role="button" data-inline="true">Terminal SSH</a>';
	echo '<a href="index.php?page=cloud" data-theme="b" data-role="button" data-inline="true">Cloud</a>';
	echo '<a href="index.php?page=scan" data-theme="d" data-role="button" data-inline="true">Scan Réseau</a>';

	echo"<h1>Localhost</h1>";
	echo"<h4>Machine installée le ";
	system('sudo perlScripts/date_system.sh');
	echo"</h4>";


?>
<div data-role="collapsible-set" data-theme="b" data-content-theme="d">
				<div data-role="collapsible">
					<h2>Architecture du processeur</h2>
<?php
 
	echo"<table cellpadding='5'>";
	system('sudo perlScripts/info_cpu.pl');
	echo"</table>";	
	echo"</div>";

	echo"<div data-role='collapsible'>";
	echo"<h2>Partitions</h2>";
	echo"<table cellpadding='5'>";
	system('sudo perlScripts/diskfree.pl');
	echo"</table>";	
	echo"</div>";

	echo"<div data-role='collapsible'>";
	echo"<h2>Utilisateurs connectés</h2>";
	echo"<table cellpadding='5'>";
	echo"<tr><td><strong>Session</strong></td><td><strong>Date</strong></td><td><strong>Heure</strong></td></tr>";
	system('sudo perlScripts/users.pl');
	echo"</table>";
	echo"</div>";	
	echo"</div>";	
}
?>
