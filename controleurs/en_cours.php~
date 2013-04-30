<?php
include('modeles/add.php');

	if(!empty($_POST['id']))
	{
		
		foreach($_POST as $key => $value)
		{
			$_POST[$key] = str_replace ('"', "'", $value);
		}
		
		edit_mission($_POST, $_POST['id']);
		

	}

	include('vues/header.php');



	include('vues/avant.php');

	include('vues/footer.php');
?>
