

<?php
if ($host == 'localhost')
{
	$type = 1;
}
else
{
	$type = 2;


        $result = mysql_query('SELECT * FROM machines WHERE id = '.$host);

        while($data = mysql_fetch_array($result))
        {
                $login = $data['login'];
                $mdp = $data['mdp'];
                $ip = $data['ip'];
        }

if (!function_exists("ssh2_connect")) die("function ssh2_connect doesn't exist");

	$con = ssh2_connect($ip, 22);
    // try to authenticate with username root, password secretpassword
        if(!ssh2_auth_password($con, $login, $mdp))
        {
                echo "fail: unable to authenticate\n";
        }

}
        if($type == 1)
        {
                echo"<h1>Localhost</h1>";
        }
        else
        {
                echo"<h1>".$ip."</h1>";
        }


        echo"<h4>";
	if($type == 1)
	{
        	system('sudo perlScripts/hostname.pl');
	}
	else
	{
		$command='sudo /var/www/scripts/perlScripts/hostname.pl';
		include('modeles/ssh.php');
	}
        echo"</h4>";

	echo"<h4>Installation date : ";
        if($type == 1)
        {
                system('sudo perlScripts/date_system.sh');
        }
        else
        {
                $command='sudo /var/www/scripts/perlScripts/date_system.sh';
                include('modeles/ssh.php');
        }

	echo"</h4>";


        echo"<h4>Last update : ";
        if($type == 1)
        {
                system('sudo perlScripts/date_upgrade.sh');
        }
        else
        {
                $command='sudo /var/www/scripts/perlScripts/date_upgrade.sh';
                include('modeles/ssh.php');
        }

        echo"</h4>";

        echo"<h4>CPU Usage : ";
        if($type == 1)
        {
                system('sudo perlScripts/cpuUsage.pl');
        }
        else
        {
                $command='sudo /var/www/scripts/perlScripts/cpuUsage.pl';
                include('modeles/ssh.php');
        }

        echo"</h4>";

        echo"<h4>Memory Usage : ";
        if($type == 1)
        {
                system('sudo perlScripts/memory.pl');
        }
        else
        {
                $command='sudo /var/www/scripts/perlScripts/memory.pl';
                include('modeles/ssh.php');
        }

        echo"</h4>";

if($type == 1)
{
	echo '<a href="index.php?page=terminal" data-role="button" data-inline="true">Shell</a>';
	echo '<a href="index.php?page=cloud" data-theme="b" data-role="button" data-inline="true">Cloud</a>';
	echo '<a href="index.php?page=scan" data-theme="d" data-role="button" data-inline="true">Network Scan</a>';
	echo '<a href="index.php?page=services&host='.$_GET['host'].'" data-theme="c" data-role="button" data-inline="true">Network Services</a>';
}

?>
<div data-role="collapsible-set" data-theme="b" data-content-theme="d">
				<div data-role="collapsible">
					<h2>CPU Architecture</h2>
<?php
 
	echo"<table cellpadding='5'>";
        if($type == 1)
        {
                system('sudo perlScripts/info_cpu.pl');
        }
        else
        {
                $command='sudo /var/www/scripts/perlScripts/info_cpu.pl';
                include('modeles/ssh.php');
        }

	echo"</table>";	
	echo"</div>";

	echo"<div data-role='collapsible'>";
	echo"<h2>Partitions</h2>";
	echo"<table cellpadding='5'>";
        if($type == 1)
        {
                system('sudo perlScripts/diskfree.pl');
        }
        else
        {
                $command='sudo /var/www/scripts/perlScripts/diskfree.pl';
                include('modeles/ssh.php');
        }

	echo"</table>";	
	echo"</div>";

	echo"<div data-role='collapsible'>";
	echo"<h2>Connected Users</h2>";
	echo"<table cellpadding='5'>";
	echo"<tr><td><strong>Session</strong></td><td><strong>Date</strong></td><td><strong>Time</strong></td></tr>";
        if($type == 1)
        {
                system('sudo perlScripts/users.pl');
        }
        else
        {
                $command='sudo /var/www/scripts/perlScripts/users.pl';
                include('modeles/ssh.php');
        }

	echo"</table>";
	echo"</div>";	
	echo"</div>";	
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
        if($type == 1)
        {
                system('sudo perlScripts/connections_tcp.pl');
        }
        else
        {
                $command='sudo /var/www/scripts/perlScripts/connections_tcp.pl';
                include('modeles/ssh.php');
        }

        echo"</table>";
        echo"</div>";

        echo"<div data-role='collapsible'>";
        echo"<h2>Routing Table</h2>";
        echo"<table cellpadding='5'>";
        if($type == 1)
        {
                system('sudo perlScripts/routes.pl');
        }
        else
        {
                $command='sudo /var/www/scripts/perlScripts/routes.pl';
                include('modeles/ssh.php');
        }

        echo"</table>";
        echo"</div>";

        echo"<div data-role='collapsible'>";
        echo"<h2>Interfaces</h2>";
        echo"<table cellpadding='5'>";
        if($type == 1)
        {
                system('sudo perlScripts/interfaces.pl');
        }
        else
        {
                $command='sudo /var/www/scripts/perlScripts/interfaces.pl';
                include('modeles/ssh.php');
        }

        echo"</table>";
        echo"</div>";
?>



