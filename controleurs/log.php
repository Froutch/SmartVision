<?php
	if(!empty($_POST['login']))
	{
		$result = exec("sudo perlScripts/log.pl ".$_POST['ip']." ".$_POST['login']." ".$_POST['mdp']);
	}
	include('vues/header.php');
	echo $result;
	include('vues/log.php');

	include('vues/footer.php');
?>
