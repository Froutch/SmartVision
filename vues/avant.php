<div class='preparation'>
<h1>Gestion des projets</h1>
<border></border>
<h2>A faire 7 jours avant leur départ :</h2>
<border></border>


<?php


	
	$query = 'SELECT volontaires.nom, volontaires.prenom, id_vol, partenaires.abreviation, missions.* FROM missions JOIN partenaires, volontaires WHERE id_partenaire = partenaires.id AND volontaires.id = missions.id_vol AND missions.prep_pret != "0000-00-00" AND missions.av_pret = "0000-00-00" AND annule = 0 ORDER BY missions.from';
	$result = mysql_query($query);
echo"<div id='wrapper'>";
	while($data = mysql_fetch_array($result))
	{		
		echo"<div class='accordionButton'><h3>n° ".$data['id_vol']." - ".$data['id']." | code : ".$data['code_mission']." | partenaire : ".$data['abreviation']." | ".$data['prenom']." ".$data['nom']." | du ".$data['from']." au ".$data['to']."</h3></div><div class='accordionContent'>";
		echo"<form method='POST' action=''>";		
		echo"<input type='hidden' name='id' value='".$data['id']."'>";
		echo"<a href='index.php?page=volontaire&id=".$data['id_vol']."'>fiche du volontaire</a> - ";
		echo"<a href='index.php?page=partenaire&id=".$data['id_partenaire']."'>fiche du partenaire</a>";
		echo"<br>";
		echo"<a href='index.php?page=mission&id=".$data['id']."'>fiche complète</a><br>";
		echo"<h2>7 jours avant de partir ! </h2>";
		
				
		display_checkbox("av_partenaire", $data['av_partenaire'], "Le partenaire a été rappelé");
		display_checkbox("av_volontaire", $data['av_volontaire'], "Le volontaire a été appelé");
		display_checkbox("av_carnet", $data['av_carnet'], "Le carnet de voyage vide a été envoyé au volontaire");
		display_checkbox("av_pret", $data['av_pret'], "Prêt pour l'étape suivante");

		echo"<input type='submit' value='Mettre à jour !'/>";
		echo"</form>";
		echo"</div>";
		
	}
	

	

	
	echo"	</div>";
	
?>



</div>
