<div class='partenaire'>

<?php
	$query = 'SELECT * FROM volontaires WHERE id='.$id;
	$result = mysql_query($query);
	while($data = mysql_fetch_array($result))
	{

	echo"<h1>".$data['prenom']." ".strtoupper($data['nom'])."</h1>";
	
	echo"<border></border>";
	echo"<h2>";
	if($data['sexe'] == 'M')
	{
		echo"Homme";
	}
	if($data['sexe'] == 'F')
	{
		echo"Femme";
	}
	
	echo " - ".$data['nationalite']." - n° ".$data['id']."</h2>";
	echo"<border></border>";
	echo"<h3>Mail : ".$data['mail']."</h3>";
	echo"<h3>Date de naissance : ".$data['date_naissance']."</h3><br>";
	}

$query = 'SELECT * FROM volontaires_facultatif WHERE id_vol='.$id;
	$result = mysql_query($query);
	while($data = mysql_fetch_array($result))
	{
	
	echo"<h3>Téléphone fixe : ".$data['fixe']."</h3>";
	echo"<h3>Téléphone mobile : ".$data['mobile']."</h3><br>";
	echo"<h3>Adresse postale : </h3>";
	echo"<h3>".$data['adresse']."</h3><br>";
	echo"<h2>Commentaires</h2>";
	echo"<p>".$data['commentaires']."</p><br>";
	
	echo"<h2>Missions</h2>";
	
	$query2 = 'SELECT * FROM missions WHERE id_vol = '.$id;
	$result2 = mysql_query($query2);
	while($data2 = mysql_fetch_array($result2))
	{
		echo"<a href='index.php?page=mission&id=".$data2['id']."'<h3>n° ".$data2['id_vol']." - ".$data2['id']." | code : ".$data2['code_mission']." du ".$data2['from']." au ".$data2['to']."</h3></a><br><br>";
	}

	echo"<br><a href='index.php?page=edit_volontaire&id=".$id."'>modifier</a> - ";
	echo"<a style='cursor: pointer;' onclick=\"if (window.confirm('Etes-vous sûr(e) de vouloir supprimer ce volontaire ?')) 
{location.href='index.php?page=delete_volontaire&id=".$id."';return true;} else {return false;}\">supprimer</a><br><br>";
	echo"<a href='index.php?page=add_mission&id_vol=".$id."'>> Déposer sa candidature ! <</a>";

	}

?>
