<?php
/* Générateur de code d'accès pour le volontaire (généré, mais non-utilisé) */
function mdp()
{
	$chaine = "abcdefghijklmnopqrstuvwxyz0123456789"; // Types des caractères
	srand((double)microtime()*1000000);
	for($i=0; $i<8; $i++) // Nombre de caractères (ici 8)
	{
	$pass .= $chaine[rand()%strlen($chaine)]; // On génère le mot de passe de 8 caractères
	}
	return $pass;
}


/* Ajoute un partenaire dans la BDD */
function add_partenaire($nom, $abreviation, $mail_ct, $tel_ct, $mail_lt, $tel_lt, $pays, $adresse, $attention, $commentaires, $skype)
{
	$query = 'INSERT INTO partenaires (nom, abreviation, mail_ct, tel_ct, mail_lt, tel_lt, pays, adresse, attention, commentaires, skype) values ("'.$nom.'", "'.$abreviation.'","'.$mail_ct.'", "'.$tel_ct.'", "'.$mail_lt.'", "'.$tel_lt.'", "'.$pays.'", "'.$adresse.'", "'.$attention.'","'.$commentaires.'", "'.$skype.'");';
	mysql_query($query);

	$query = 'SELECT max(id) as id FROM partenaires;';
	$result = mysql_query($query);
	while($data = mysql_fetch_array($result))
	{
		$return = $data['id'];
	}

		// ajout partenaire dans la mailing listes partenaire@servicevolontaire.org

	try {
								 $soap = new SoapClient("https://www.ovh.com/soapi/soapi-re-1.11.wsdl");
								 //login
								 //echo '<!-- mailing liste '; // pour eviter que le password ne soit visible en cas d'erreur
								 $password= 'bofkot'; // sinon le password apparait en cas d'erreur !!!
								 $session = $soap->login("DP9054-OVH", "$password","fr", false) or die ("probleme de connection avec soap");
								// echo '-->';
								 //mailingListSubscriberAdd

								 		if ($mail_ct!=''){
								 			  					 		$soap->mailingListSubscriberAdd($session, "servicevolontaire.org", "partenaire", $mail_ct);
								 			  					 	 }
								 		if ($mail_lt!=''){
								 											$soap->mailingListSubscriberAdd($session, "servicevolontaire.org", "partenaire", $mail_lt);
								 										 }




								 //logout
								 //echo "<!-- logout\n ";
								 $soap->logout($session);
								 //echo "fin logout --> \n";
							}
							catch(SoapFault $fault)
							{

							  $additional_headers  = "MIME-Version: 1.0 \n";
								$additional_headers .= "Content-Transfer-Encoding: 8bit \n";
								$additional_headers .= "Content-type: text/html; charset=utf-8 \n";
								$additional_headers .= "From: newsletter_php@svi.org  \n";
							  mail($webmaster ,'mailing liste: probleme soap mailing liste  dans la gestion des partenaire ovh :'.$mail_ct.'/'.$mail_lt,  $fault , $additional_headers);
							  echo $fault;
							  echo "<script>alert('Problème de surchage du serveur de mailing liste .Ré-essayez dans quelques minutes.Rechargement de la page.');</script> \n";
							}


	// fin ajout partenaire dans la mailing listes partenaire@servicevolontaire.org



	return $return;
}

/* Enregistre les modifications d'un partenaire */
function edit_partenaire($id, $nom, $abreviation, $mail_ct, $tel_ct, $mail_lt, $tel_lt, $pays, $adresse, $attention, $commentaires, $skype)
{
	$query = 'UPDATE partenaires SET nom = "'.$nom.'", abreviation = "'.$abreviation.'", mail_ct = "'.$mail_ct.'", tel_ct = "'.$tel_ct.'", mail_lt = "'.$mail_lt.'", tel_lt = "'.$tel_lt.'", pays = "'.$pays.'", adresse = "'.$adresse.'", attention = "'.$attention.'", commentaires = "'.$commentaires.'", skype = "'.$skype.'" WHERE id = '.$id;
	mysql_query($query);
}

/* Supprime un partenaire */
function delete_partenaire($id)
{
	$query = "DELETE FROM partenaires WHERE id = ".$id;
	mysql_query($query);
}

/* Supprime un volontaire */
function delete_volontaire($id)
{
	$query = "DELETE FROM volontaires WHERE id = ".$id;
	mysql_query($query);

	$query = "DELETE FROM volontaires_facultatif WHERE id_vol = ".$id;
	mysql_query($query);
}

/* Ajoute un volontaire */
function add_volontaire($nom, $prenom, $mail, $date_naissance, $sexe, $nationalite)
{
	$query = 'INSERT INTO volontaires (nom, prenom, mail, date_naissance, sexe, nationalite) values ("'.$nom.'", "'.$prenom.'","'.$mail.'", "'.$date_naissance.'", "'.$sexe.'", "'.$nationalite.'");';
	mysql_query($query);

	$query = 'SELECT max(id) as id FROM volontaires;';
	$result = mysql_query($query);

	while($data = mysql_fetch_array($result))
	{
		$return = $data['id'];
	}

	// ajoute le volontaire dans les mailing listes
		try {
								 $soap = new SoapClient("https://www.ovh.com/soapi/soapi-re-1.11.wsdl");
								 //login
								 //echo '<!-- mailing liste '; // pour eviter que le password ne soit visible en cas d'erreur
								 $password= 'bofkot'; // sinon le password apparait en cas d'erreur !!!
								 $session = $soap->login("DP9054-OVH", "$password","fr", false) or die ("probleme de connection avec soap");
								// echo '-->';
								 //mailingListSubscriberAdd

								 		//echo '<!-- ajout dans svi5 ';
								 		$soap->mailingListSubscriberAdd($session, "servicevolontaire.org", "svi5", $mail);
								 		//echo ' fin ajout dans svi5 -->';

										//echo '<!-- ajout dans svi_community ';
								 		$soap->mailingListSubscriberAdd($session, "servicevolontaire.org", "svi_community", $mail);
								 		//echo ' fin ajout dans svi_community -->';


								 //logout
								 //echo "<!-- logout\n ";
								 $soap->logout($session);
								 //echo "fin logout --> \n";
							}
							catch(SoapFault $fault)
							{

							  $additional_headers  = "MIME-Version: 1.0 \n";
								$additional_headers .= "Content-Transfer-Encoding: 8bit \n";
								$additional_headers .= "Content-type: text/html; charset=utf-8 \n";
								$additional_headers .= "From: newsletter_php@svi.org  \n";
							  mail($webmaster ,'mailing liste: probleme soap mailing liste  dans la gestion des volontaires ovh :'.$mail,  $fault , $additional_headers);
							  echo $fault;
							  echo "<script>alert('Problème de surchage du serveur de mailing liste .Ré-essayez dans quelques minutes.Rechargement de la page.');</script> \n";
							}


	// fin ajout volontaire dans les mailing listes

	return $return;


}

/* Ajoute les paramètres facultatifs du volontaire */
function add_volontaire_facultatif($id_vol, $adresse, $fixe, $mobile, $commentaires)
{
	$query = 'INSERT INTO volontaires_facultatif (id_vol, adresse, fixe, mobile, commentaires) values ("'.$id_vol.'", "'.$adresse.'","'.$fixe.'", "'.$mobile.'", "'.$commentaires.'");';
	mysql_query($query);
}


/* Modifie les informations du volontaire */
function edit_volontaire($id, $nom, $prenom, $mail, $date_naissance, $sexe, $nationalite)
{
	$query = 'UPDATE volontaires SET nom = "'.$nom.'", prenom = "'.$prenom.'", mail = "'.$mail.'", date_naissance = "'.$date_naissance.'", sexe = "'.$sexe.'", nationalite = "'.$nationalite.'" WHERE id = '.$id;
	mysql_query($query);
}

/* Modifie les informations facultatives du volontaire */
function edit_volontaire_facultatif($id_vol, $adresse, $fixe, $mobile, $commentaires)
{
	$query = 'UPDATE volontaires_facultatif SET adresse = "'.$adresse.'", fixe = "'.$fixe.'", mobile = "'.$mobile.'", commentaires = "'.$commentaires.'" WHERE id_vol = '.$id_vol;
	mysql_query($query);
}

/* Ajoute une mission dans la BDD */
function add_mission($donnees)
{



	$query = 'INSERT INTO missions SET `id` = ""';
	mysql_query($query);

	$query = 'SELECT max(id) as id FROM missions';
	$result = mysql_query($query);
	while($data = mysql_fetch_array($result))
	{
		$id = $data['id'];
	}


	foreach($donnees as $key => $value)
	{
		$donnees[$key] = str_replace ( '"', "'", $value);
		$query = 'UPDATE missions SET `'.$key.'` = "'.$value.'" WHERE id = '.$id.';';
		mysql_query($query);

	}

	$cle = mdp();
	$query = 'UPDATE missions SET cle = "'.$cle.'" WHERE id = '.$id.';';
	mysql_query($query);
	return $id;



}

/* Met à jour les informations sur la mission (récupère un tableau à deux dimensions dans $donnees donc la clé correspond au nom de la colonne)*/
function edit_mission($donnees, $id)
{


	foreach($donnees as $key => $value)
	{
		$donnees[$key] = str_replace ( '"', "'", $value);



		$query = 'UPDATE missions SET `'.$key.'` = "'.$value.'" WHERE id = '.$id.';';
		mysql_query($query);

	}

}

/* Affiche la checkbox d'une information sur une mission avec sa date assignée */
function display_checkbox($col,$value, $commentaire)
{

		echo"	<input type='checkbox' ";
		if($value != '0000-00-00')
		{
			echo"checked='1' value='".$value."'";
		}
		else
		{
			echo"value='".date('Y-m-d', time())."' ";
		}

		echo "name='".$col."' />";

		echo $commentaire;


		if($value != '0000-00-00')
		{
			echo" (le ".$value.")";
		}
		echo "<br>";
}




?>
