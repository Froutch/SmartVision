<?php

	$_GET['page'] = $_POST['page'];

	$login = $_POST['login'];
	$mdp = $_POST['mdp'];
	
	if(isset($_POST['login']) && isset($_POST['mdp']))
	{
		include('modeles/check_connect.php');

		$login_error = check_connect($login, $mdp);

		if($login_error == 0)
		{
			if($_POST['query'] == 'page=login_admin')
			{
				header("Location:index.php?page=welcome");
			}
			else
			{
				header("Location:index.php?".$_POST['query']);
			}
		}
		else
		{
			include('controleurs/login_admin.php');
		}
	}
	else
	{
		include('controleurs/login_admin.php');
	}
?>
