<div class='preparation'>
<h1>Gestion des projets</h1>
<border></border>
<h2>Projets venant de se terminer :</h2>
<border></border>


<?php


	
	$query = 'SELECT volontaires.nom, volontaires.prenom, id_vol, partenaires.abreviation, missions.* FROM missions JOIN partenaires, volontaires WHERE id_partenaire = partenaires.id AND volontaires.id = missions.id_vol AND missions.prep_pret != "0000-00-00" AND missions.av_pret != "0000-00-00" AND missions.en_pret != "0000-00-00" AND missions.ap_pret = "0000-00-00" AND annule = 0 ORDER BY missions.from';
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
				
		display_checkbox("ap_appel", $data['ap_appel'], "Le volontaire a été appelé à son retour");
		echo"<br>";
		echo"Le volontaire a fait un retour : <br>";
		display_checkbox("ap_ecrit", $data['ap_ecrit'], "Ecrit");
		display_checkbox("ap_oral", $data['ap_oral'], "Oral");
		display_checkbox("ap_video", $data['ap_video'], "Vidéo");
		echo"Infos supplémentaire sur le support : <br>";
		echo"<TEXTAREA rows='3' name='ap_com' placeholder='Infos sur le support'>".$data['ap_com']."</TEXTAREA><br><br>";
		echo"Note du chantier : ";
		echo"<select name='ap_note_chantier'>";
		
		echo"<option value='1'";
		if($data['ap_note_chantier'] == '1')
		{
			echo"selected='selected'";
		}
		echo">Bon</option>";
		echo"<option value='0'";
		if($data['ap_note_chantier'] == '0')
		{
			echo"selected='selected'";
		}
		echo">Mitigé</option>";
		echo"<option value='-1'";
		if($data['ap_note_chantier'] == '-1')
		{
			echo"selected='selected'";
		}
		echo">Mauvais</option>";
		echo"</select><br>";
		echo"<TEXTAREA rows='3' name='ap_com_chantier' placeholder='Commentaires sur la note du chantier'>".$data['ap_com_chantier']."</TEXTAREA><br><br>";




		echo"Note du partenaire : ";
		echo"<select name='ap_note_partenaire'>";
		
		echo"<option value='1'";
		if($data['ap_note_partenaire'] == '1')
		{
			echo"selected='selected'";
		}
		echo">Bon</option>";
		echo"<option value='0'";
		if($data['ap_note_partenaire'] == '0')
		{
			echo"selected='selected'";
		}
		echo">Mitigé</option>";
		echo"<option value='-1'";
		if($data['ap_note_partenaire'] == '-1')
		{
			echo"selected='selected'";
		}
		echo">Mauvais</option>";
		echo"</select><br>";
		echo"<TEXTAREA rows='3' name='ap_com_partenaire' placeholder='Commentaires sur la note du partenaire'>".$data['ap_com_partenaire']."</TEXTAREA><br><br>";



		display_checkbox("ap_merci_partenaire", $data['ap_merci_partenaire'], "Le partenaire a été remercié");
		display_checkbox("ap_pret", $data['ap_pret'], "Mission prête à être archivée");

		echo"<input type='submit' value='Mettre à jour !'/>";
		echo"</form>";
		echo"</div>";
		
	}
	

	

	
	echo"	</div>";
	
?>



</div>
