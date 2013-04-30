<?php

	$id = $_GET['id'];

	$query = 'UPDATE missions SET `annule` = 1 WHERE id = '.$id;
	mysql_query($query);
	
	header("Location:index.php?page=welcome");

?>
