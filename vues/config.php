

<?php
if ($host == 'localhost')
{
	echo"<h1>Localhost</h1>";
	echo"<h4>Machine installée le ";
	system('sudo perlScripts/date_system.sh');
	echo"</h4>";

        echo"<h4>Dernière mise à jour le  ";
        system('sudo perlScripts/date_upgrade.sh');
        echo"</h4>";



	echo '<a href="index.php?page=terminal" data-role="button" data-inline="true">Terminal SSH</a>';
	echo '<a href="index.php?page=cloud" data-theme="b" data-role="button" data-inline="true">Cloud</a>';
	echo '<a href="index.php?page=scan" data-theme="d" data-role="button" data-inline="true">Scan Réseau</a>';
	echo '<a href="index.php?page=services&host='.$_GET['host'].'" data-theme="c" data-role="button" data-inline="true">Services Réseau</a>';


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
<div data-role="collapsible-set" data-theme="b" data-content-theme="d">
                                <div data-role="collapsible">
                                        <h2>Connexions TCP</h2>
<?php

        echo"<table cellpadding='5'>";
	echo "<tr>";
	echo"<td><strong>Proto</strong></td>";
	echo"<td><strong>Recv-Q</strong></td>";
	echo"<td><strong>Send-Q</strong></td>";
	echo"<td><strong>Adresse Locale</strong></td>";
	echo"<td><strong>Adresse Distante</strong></td>";
	echo"<td><strong>Etat</strong></td>";
	echo"</tr>";
        system('sudo perlScripts/connections_tcp.pl');
        echo"</table>";
        echo"</div>";

        echo"<div data-role='collapsible'>";
        echo"<h2>Table de routage</h2>";
        echo"<table cellpadding='5'>";
        system('sudo perlScripts/routes.pl');
        echo"</table>";
        echo"</div>";

        echo"<div data-role='collapsible'>";
        echo"<h2>Interfaces</h2>";
        echo"<table cellpadding='5'>";
        system('sudo perlScripts/interfaces.pl');
        echo"</table>";
        echo"</div>";




?>



