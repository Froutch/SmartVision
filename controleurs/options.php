<?php

	
	if(!empty($_POST['options']))
	{
		include('modeles/add.php');
		foreach($_POST as $key => $value)
		{
			$_POST[$key] = str_replace ( '"', "'", $value);
		}
		echo var_dump($_POST);
		edit_volontaire($id, $_POST['nom'], $_POST['prenom'], $_POST['mail'], $_POST['date_naissance'], $_POST['sexe'], $_POST['nationalite']);

		edit_volontaire_facultatif($id, $_POST['adresse'], $_POST['fixe'], $_POST['mobile'], $_POST['commentaires']);
		header("Location:index.php?page=volontaire&id=".$id);
	}


	include('vues/header.php');
	
	include('vues/options.php');
	
	include('vues/footer.php');
?>
