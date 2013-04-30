<?php
/*
if(!empty($_GET['prenom']))
{
	$query = 'SELECT id FROM volontaires WHERE prenom="'.$_GET['prenom'].'" AND date_naissance="'.$_GET['date_naissance'].'"';
	$result = mysql_query($query);
	
	if(!empty($result))
	{
		while($data = mysql_fetch_array($result))
		{
			$id = $data['id'];
		}
		if($id != 1)
		{
			header("Location:index.php?page=volontaire&id=".$id);
		}
	}
}*/
	if(!empty($_POST['mail']))
	{
		include('modeles/add.php');
		foreach($_POST as $key => $value)
		{
			$_POST[$key] = str_replace ( '"', "'", $value);
		}
		$_POST['nom'] = strtoupper($_POST['nom']);
		$id = add_volontaire($_POST['nom'], $_POST['prenom'], $_POST['mail'], $_POST['date_naissance'], $_POST['sexe'], $_POST['nationalite']);

		add_volontaire_facultatif($id, $_POST['adresse'], $_POST['fixe'], $_POST['mobile'], $_POST['commentaires']);
		header("Location:index.php?page=volontaire&id=".$id);
	}


	include('vues/header.php');
	
	include('vues/add_volontaire.php');
	
	include('vues/footer.php');
?>
