<?php
	include('modeles/terminal.php');
	if(!empty($_POST['req']))
	{
		command($_POST['req']);
	}
	include('vues/header.php');

	include('vues/terminal.php');

	include('vues/footer.php');
?>
