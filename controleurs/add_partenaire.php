<?php
	
	if(!empty($_POST['nom']))
	{
		include('modeles/add.php');
		foreach($_POST as $key => $value)
		{
			$_POST[$key] = str_replace ( '"', "'", $value);
		}
		$id = add_partenaire($_POST['nom'], $_POST['abreviation'], $_POST['mail_ct'], $_POST['tel_ct'], $_POST['mail_lt'], $_POST['tel_lt'], $_POST['pays'], $_POST['adresse'], $_POST['attention'], $_POST['commentaires'], $_POST['skype']);
		header("Location:index.php?page=partenaire&id=".$id);
	}


	include('vues/header.php');
	
	include('vues/add_partenaire.php');
	
	include('vues/footer.php');
?>
