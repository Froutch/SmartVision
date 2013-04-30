<div class='fiche_complete'>
<h1>Gestion des projets</h1>
<border></border>
<h2>Fiche complète :</h2>
<border></border>


<?php


	
	$query = 'SELECT volontaires.nom, volontaires.prenom, id_vol, partenaires.abreviation, missions.* FROM missions JOIN partenaires, volontaires WHERE id_partenaire = partenaires.id AND volontaires.id = missions.id_vol AND missions.id ='.$id;
	$result = mysql_query($query);

	while($data = mysql_fetch_array($result))
	{		
		echo"<h3>n° ".$data['id_vol']." - ".$data['id']." | code : ".$data['code_mission']." | partenaire : ".$data['abreviation']." | ".$data['prenom']." ".$data['nom']." | du ".$data['from']." au ".$data['to']."</h3>";


		$query2 = 'SELECT login FROM admins WHERE id='.$data['id_admin'];
		$result2 = mysql_query($query2);
		while($data2 = mysql_fetch_array($result2))
		{
			$admin = $data2['login'];
		}



		echo"<h3>Code d'accès volontaire : ".$data['cle'].". Dossier créé par ".$admin."</h3>";
		echo"<form method='POST' action=''>";		
		echo"<input type='hidden' name='id' value='".$data['id']."'>";
		echo"<a href='index.php?page=volontaire&id=".$data['id_vol']."'>fiche du volontaire</a> - ";
		echo"<a href='index.php?page=partenaire&id=".$data['id_partenaire']."'>fiche du partenaire</a>";
		

		echo"<br><a style='cursor: pointer;' onclick=\"if (window.confirm('Etes-vous sûr(e) de vouloir annuler cette mission ?')) 
{location.href='index.php?page=annuler_mission&id=".$data['id']."';return true;} else {return false;}\">annuler</a><br><br>";


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
		display_checkbox("prep_assure", $data['prep_assure'], "Le candidat est assuré");
		display_checkbox("prep_redbook", $data['prep_redbook'], "La mission est dans le RedBook");






		
		if($data['long_terme'] == 1)
		{

			
			
		
			echo"(long terme) Conférence téléphonique prévue le :";
			echo"<input type='text' name='prep_conf_tel' id='popupDatepicker' placeholder='Date de rdv' value=\"".$data['prep_conf_tel']."\"><br>";
			

			echo "<br>";

		}

				
		display_checkbox("prep_pret", $data['prep_pret'], "Prêt pour l'étape suivante");

		echo"<h2>7 jours avant</h2>";
		display_checkbox("av_partenaire", $data['av_partenaire'], "Le partenaire a été rappelé");
		display_checkbox("av_volontaire", $data['av_volontaire'], "Le volontaire a été appelé");
		display_checkbox("av_carnet", $data['av_carnet'], "Le carnet de voyage vide a été envoyé au volontaire");
		display_checkbox("av_pret", $data['av_pret'], "Prêt pour l'étape suivante");


		echo"<h2>En cours de mission</h2>";
		display_checkbox("en_mail", $data['en_mail'], "Mail au volontaire à son arrivée");
		display_checkbox("en_eval", $data['en_eval'], "Evaluation de mi-parcours effectuée");
		display_checkbox("en_pret", $data['en_pret'], "Prêt pour l'étape suivante");
		
		echo"<h2>Après la mission</h2>";


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
		
		
	}
	

	

	
	
	
?>



</div>
