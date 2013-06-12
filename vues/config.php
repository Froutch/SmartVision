

<?php
if ($host == 'localhost')
{
	echo"<h1>Localhost</h1>";
	echo"<h4>Installation date : ";
	system('sudo perlScripts/date_system.sh');
	echo"</h4>";

        echo"<h4>Last update : ";
        system('sudo perlScripts/date_upgrade.sh');
        echo"</h4>";



	echo '<a href="index.php?page=terminal" data-role="button" data-inline="true">Shell</a>';
	echo '<a href="index.php?page=cloud" data-theme="b" data-role="button" data-inline="true">Cloud</a>';
	echo '<a href="index.php?page=scan" data-theme="d" data-role="button" data-inline="true">Network Scan</a>';
	echo '<a href="index.php?page=services&host='.$_GET['host'].'" data-theme="c" data-role="button" data-inline="true">Network Services</a>';


?>
<div data-role="collapsible-set" data-theme="b" data-content-theme="d">
				<div data-role="collapsible">
					<h2>CPU Architecture</h2>
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
	echo"<h2>Connected Users</h2>";
	echo"<table cellpadding='5'>";
	echo"<tr><td><strong>Session</strong></td><td><strong>Date</strong></td><td><strong>Time</strong></td></tr>";
	system('sudo perlScripts/users.pl');
	echo"</table>";
	echo"</div>";	
	echo"</div>";	
}
?>
<div data-role="collapsible-set" data-theme="b" data-content-theme="d">
                                <div data-role="collapsible">
                                        <h2>TCP Connections</h2>
<?php

        echo"<table cellpadding='5' style='font-size: 0.8em;'>";
	echo "<tr>";
	echo"<td><strong>Proto</strong></td>";
	echo"<td><strong>Local Address</strong></td>";
	echo"<td><strong>Remote Address</strong></td>";
	echo"<td><strong>State</strong></td>";
	echo"</tr>";
        system('sudo perlScripts/connections_tcp.pl');
        echo"</table>";
        echo"</div>";

        echo"<div data-role='collapsible'>";
        echo"<h2>Routing Table</h2>";
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



