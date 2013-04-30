<?php

	
	
	if(!empty($_GET['recherche_m']))
	{
	
	
		$query_vol = 'SELECT DISTINCT missions.id, volontaires.nom as nom_vol, missions.from, missions.to, missions.pays, partenaires.abreviation, missions.code_mission FROM missions, volontaires, partenaires WHERE missions.id_vol = volontaires.id AND missions.id_partenaire = partenaires.id';
		
		
		if(!empty($_GET['id'])) $query_vol .= ' AND volontaires.id="'.$_GET['id'].'"';
		if(!empty($_GET['sexe'])) $query_vol .= ' AND volontaires.sexe="'.$_GET['sexe'].'"';
		if(!empty($_GET['nationalite'])) $query_vol .= ' AND volontaires.nationalite="'.$_GET['nationalite'].'"';
		if(!empty($_GET['pays'])) $query_vol .= ' AND missions.pays="'.$_GET['pays'].'"';
		if(!empty($_GET['date_naissance'])) $query_vol .= ' AND volontaires.date_naissance="'.$_GET['date_naissance'].'"';
		if(!empty($_GET['mail'])) $query_vol .= ' AND volontaires.mail="'.$_GET['mail'].'"';
		if(!empty($_GET['nom'])) $query_vol .= ' AND volontaires.nom="'.$_GET['nom'].'"';
		if(!empty($_GET['prenom'])) $query_vol .= ' AND volontaires.prenom="'.$_GET['prenom'].'"';
		if(!empty($_GET['code_mission'])) $query_vol .= ' AND missions.code_mission="'.$_GET['code_mission'].'"';
		if(!empty($_GET['ap_pret']))
		{
			$query_vol .= ' AND missions.ap_pret != "0000-00-00"';
		}
		else
		{
			$query_vol .= ' AND missions.ap_pret = "0000-00-00"';
		}
		if(!empty($_GET['annule']))
		{
			$query_vol .= ' AND missions.annule = 1';
		}
		else
		{
			$query_vol .= ' AND missions.annule = 0';
		}
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
		if(!empty($_GET['id_partenaire'])) $query_vol .= ' AND missions.id_partenaire="'.$_GET['id_partenaire'].'"';
		if(!empty($_GET['from'])) $query_vol .= ' AND missions.from >="'.$_GET['from'].'"';
		if(!empty($_GET['to'])) $query_vol .= ' AND missions.to <="'.$_GET['to'].'"';


		$result_vol = mysql_query($query_vol);
		
		
	}

	

	include('vues/header.php');
	
	include('vues/recherche_m.php');
	
	include('vues/footer.php');
?>
