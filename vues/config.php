

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
                echo"<center><h1>Localhost</h1></center>";
        }
        else
        {
                echo"<center><h1>".$ip."</h1></center>";
        }

        if($type == 1)
        {
                echo"<center><h4>UpTime : ";
		system('sudo perlScripts/uptime.pl');				
		echo"</h4></center>";
        }
        else
        {
                echo"<center><h4>UpTime : ";
                $command='sudo /var/www/scripts/perlScripts/uptime.pl';
                include('modeles/ssh.php');

		echo"</h4></center>";
        }




echo'<div data-role="collapsible-set" data-theme="b" data-content-theme="d">
                                <div data-role="collapsible">
                                        <h2>Main Informations</h2>';

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

if($type == 1)
{
        echo"</h4>";
	echo"</div>";
        echo'<div data-role="collapsible">';
        echo'<h2>Main Tools</h2>';
?>
<ul data-role="listview" data-split-icon="gear" data-split-theme="d">
                        <li><a href="index.php?page=terminal">
                                <img src="design/images/button_shell.png" />
                                <h3>Shell</h3>
                                <p>As simple as it looks like.</p>
                                </a>
                        </li>
                        <li><a href="index.php?page=scan">
                                <img src="design/images/button_scan.png" />
                                <h3>Network Scan</h3>
                                <p>Check your Network and manage your remote machines.</p>
                                </a>
                        </li>
                        <li><a rel="external" href="index.php?page=services&host=localhost">
                                <img src="design/images/button_services.png" />
                                <h3>Network Services</h3>
                                <p>Watch your services available and (re)activate them !</p>
                                </a>
                        </li>
                        <li><a rel="external" href="index.php?page=edit_config">
                                <img src="design/images/button_config.png" />
                                <h3>File Editor</h3>
                                <p>Edit any file and add it to your favourites !</p>
                                </a>
                        </li>

                        <li><a href="index.php?page=modules">
                                <img src="design/images/button_config.png" />
                                <h3>Modules</h3>
                                <p>Some useful modules for your server.</p>
                                </a>
                        </li>
                        <li><a href="wall.html">
                                <img src="design/images/button_message.png" />
                                <h3>Broadcast Message</h3>
                                <p>Send a message to your workers !</p>
                                </a>
                        </li>
                        <li><a href="graph.html">
                                <img src="design/images/button_graph.png" />
                                <h3>Graphs</h3>
                                <p>Real-Time monitoring.</p>
                                </a>
                        </li>


</ul>

<?php
}
?>

</div>
</div>

<div data-role="collapsible-set" data-theme="c" data-content-theme="d">
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



