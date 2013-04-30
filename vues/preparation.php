<div class='preparation'>
<h1>Gestion des projets</h1>
<border></border>
<h2>Projets en préparation :</h2>
<border></border>


<?php


	
	$query = 'SELECT volontaires.nom, volontaires.prenom, id_vol, partenaires.abreviation, missions.* FROM missions JOIN partenaires, volontaires WHERE id_partenaire = partenaires.id AND volontaires.id = missions.id_vol AND missions.prep_pret = "0000-00-00" AND annule = 0 ORDER BY missions.from';
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
		
			echo"<h2>Validation</h2>";
	



		display_checkbox("val_transf", $data['val_transf'], "La candidature a été envoyée au partenaire");
		display_checkbox("val_accept", $data['val_accept'], "La candidature a été acceptée par le partenaire");

		
		echo"<br>Dates décidées : ";
		echo"<label for='from'>du</label> ";
		echo"<input type='text' value='".$data['from']."' id='from' name='from' required>";
		echo" <label for='to'>au</label> ";
		echo"<input type='text' id='to' value='".$data['to']."' name='to' required><br>";
	
		echo "<br>";

		echo"Pays décidé : ";
		echo"<select name='pays' style='width: 200px;'>";

		$query2 = 'SELECT langFR from countries ORDER BY langFR;';
		$result2 = mysql_query($query2);
	 	while($data2 = mysql_fetch_array($result2))
		{
			if($data['pays'] == $data2['langFR'])
			{
				echo "<option selected='selected'>".$data2['langFR']."</option>";
			}
			else
			{
				echo '<option>'.$data2['langFR'].'</option>';
			}
		}

		echo"</select><br>";





		display_checkbox("val_paiement", $data['val_paiement'], "Le candidat a payé ses frais d'inscription");
		echo"<h2>Préparation</h2>";
	



		display_checkbox("val_accept_mail", $data['val_accept_mail'], "Fiche de confirmation reçue");
		display_checkbox("val_accept_confirm", $data['val_accept_confirm'], "Fiche de confirmation envoyée au partenaire");
		display_checkbox("val_feuille_route_dispo", $data['val_feuille_route_dispo'], "La feuille de route est disponible");
		display_checkbox("val_feuille_route_envoi", $data['val_feuille_route_envoi'], "La feuille de route a été envoyée au candidat");
		display_checkbox("prep_cert_bvm", $data['prep_cert_bvm'], "Certificat de Bonne Vie et Moeurs");
		display_checkbox("prep_assure", $data['prep_assure'], "Le candidat est assuré");
		display_checkbox("prep_redbook", $data['prep_redbook'], "La mission est dans le RedBook");

		





		






		if($data['long_terme'] == 1)
		{

			
			
		
			echo"(long terme) Conférence téléphonique prévue le :";
			echo"<input type='text' name='prep_conf_tel' id='popupDatepicker' placeholder='Date de rdv' value=\"".$data['prep_conf_tel']."\"><br>";
			

			echo "<br>";

		}

				
		display_checkbox("prep_pret", $data['prep_pret'], "Prêt pour l'étape suivante");


		echo"<input type='submit' value='Mettre à jour !'/>";
		echo"</form>";
		echo"</div>";
		
	}
	

	

	
	echo"	</div>";
	
?>



</div>
