<?php
	include('modeles/add.php');
	if(!empty($_POST['login']))
	{
		$result = exec("sudo perlScripts/log.pl ".$_POST['ip']." ".$_POST['login']." ".$_POST['mdp']);
		if($result == "2")
		{
			add_machine($_POST['ip'], $_POST['login'], $_POST['mdp']);
			header("Location:index.php?page=register_log");
		}
	}
	include('vues/header.php');
	include('vues/log.php');

	include('vues/footer.php');
?>
