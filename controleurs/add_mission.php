<?php

	
	
	if(!empty($_POST['id_partenaire']))
	{
		include('modeles/add.php');
	
		$id = add_mission($_POST);
		
		
		include('vues/header.php');
	
		include('vues/preparation.php');
	
		include('vues/footer.php');
	}
	else
	{
		include('vues/header.php');
	
		include('vues/add_mission.php');
	
		include('vues/footer.php');
	}
?>
