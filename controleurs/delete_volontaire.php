<?php

	$id = $_GET['id'];

	
	
	include('modeles/add.php');
		
	delete_volontaire($id);

	header('Location:index.php?page=welcome');
?>
