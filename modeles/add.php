<?php
function add_machine($ip, $log, $mdp)
{
	$query = 'INSERT INTO machines values("", "'.$ip.'", "'.$log.'", "'.$mdp.'")';
	mysql_query($query);
}
?>
