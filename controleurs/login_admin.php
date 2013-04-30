<?php
	include('vues/header.php');
	
	if($_GET['page'] == 'login_admin' && !empty($_SESSION['id_admin']))
	{
		include('vues/welcome.php');
	}
	else
	{
		include('vues/login_admin.php');
	}
	include('vues/footer.php');
?>
