<?php

	
	
	if(!empty($_GET['recherche_vol']))
	{
		
	
	
		$query_vol = 'SELECT DISTINCT volontaires.*, volontaires_facultatif.* FROM volontaires JOIN volontaires_facultatif, missions, partenaires WHERE volontaires.id = volontaires_facultatif.id_vol';
		
		
		if(!empty($_GET['id'])) $query_vol .= ' AND volontaires.id="'.$_GET['id'].'"';
		if(!empty($_GET['sexe'])) $query_vol .= ' AND volontaires.sexe="'.$_GET['sexe'].'"';
		if(!empty($_GET['nationalite'])) $query_vol .= ' AND volontaires.nationalite="'.$_GET['nationalite'].'"';
		if(!empty($_GET['pays'])) $query_vol .= ' AND missions.pays="'.$_GET['pays'].'"';
		if(!empty($_GET['date_naissance'])) $query_vol .= ' AND volontaires.date_naissance="'.$_GET['date_naissance'].'"';
		if(!empty($_GET['mail'])) $query_vol .= ' AND volontaires.mail="'.$_GET['mail'].'"';
		if(!empty($_GET['nom'])) $query_vol .= ' AND volontaires.nom = "'.strtoupper($_GET['nom']).'"';
		if(!empty($_GET['prenom'])) $query_vol .= ' AND volontaires.prenom="'.$_GET['prenom'].'"';
		if(!empty($_GET['age_from']))
		{
			$date_mini = date("Y") - $_GET['age_from'];
			$date_mini .= date("-m-d");
			$query_vol .= ' AND volontaires.date_naissance <= "'.$date_mini.'"';
		}
		if(!empty($_GET['age_to']))
		{
			$date_maxi = date("Y") - $_GET['age_to'];
			$date_maxi .= date("-m-d");
			$query_vol .= ' AND volontaires.date_naissance >= "'.$date_maxi.'"';
		}
		if(!empty($_GET['id_partenaire']) || !empty($_GET['from']) || !empty($_GET['to']) || !empty($_GET['pays']))
		{
			$query_vol .= ' AND missions.id_vol = volontaires.id';
		}
		if(!empty($_GET['id_partenaire'])) $query_vol .= ' AND missions.id_partenaire="'.$_GET['id_partenaire'].'"';
		if(!empty($_GET['from'])) $query_vol .= ' AND missions.from >="'.$_GET['from'].'"';
		if(!empty($_GET['to'])) $query_vol .= ' AND missions.to <="'.$_GET['to'].'"';


		$result_vol = mysql_query($query_vol);
		
		
	}
	if(!empty($_GET['recherche_mission']))
	{
		
	
	
		$query_mission = 'SELECT DISTINCT missions.* FROM missions WHERE missions.id != 0';
		
		
		if(!empty($_GET['id'])) $query_mission .= ' AND missions.id="'.$_GET['id'].'"';
		if(!empty($_GET['code_mission'])) $query_mission .= ' AND missions.code_mission="'.$_GET['code_mission'].'"';
		if(!empty($_GET['id_partenaire'])) $query_mission .= ' AND missions.id_partenaire="'.$_GET['id_partenaire'].'"';
		if(!empty($_GET['from'])) $query_mission .= ' AND missions.from >="'.$_GET['from'].'"';
		if(!empty($_GET['to'])) $query_mission .= ' AND missions.to <="'.$_GET['to'].'"';
		if(!empty($_GET['pays'])) $query_mission .= ' AND missions.pays="'.$_GET['pays'].'"';

		$result_mission = mysql_query($query_mission);
		
		
	}
	

	include('vues/header.php');
	
	include('vues/recherche.php');
	
	include('vues/footer.php');
?>
