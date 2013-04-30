<?php
  session_start();
  $webmaster='pierre@servicevolontaire.org'; //email du webmaster pour recevoir messages d'erreurs
  //echo ("<!--mysql_connect.php debut-->\n");
	include('modeles/mysql_connect.php');
  //echo ("<!--mysql_connect.php fin-->\n");
 	if( $_GET['disconnect'] == 1)
	{
		unset($_SESSION['id_admin']);
		unset($_SESSION['login']);
		unset($_SESSION['mdp']);
		unset($_SESSION['mail']);
		unset($_SESSION['notif']);
		header('Location:index.php?page=login_admin');

	}
	if(empty($_SESSION['id_admin']) && $_GET['page'] != 'connect' && $_GET['page'] != 'login_admin')
	{
		$_GET['page'] = 'login_admin';
	}

	$_GET['page'] = str_replace(".","",$_GET['page']);
	$_GET['page'] = str_replace("/","",$_GET['page']);

	if (!empty($_GET['page']) && is_file('controleurs/'.$_GET['page'].'.php'))
	{
		if($_GET['page'] == 'connect' && !empty($_SESSION['id_admin']))
		{
			include 'controleurs/welcome.php';
		}
		else
		{
			include 'controleurs/'.$_GET['page'].'.php';
		}
	}
	else
	{
		if(!empty($_SESSION['id_admin']))
		{
			include 'controleurs/welcome.php';
		}
		else
		{
			include 'controleurs/login_admin.php';
		}
	}
	echo ("<!--fin index.php--> \n");
 ?>
