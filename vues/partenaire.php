<div class='partenaire'>

<?php
	$query = 'SELECT * FROM partenaires WHERE id='.$id;
	$result = mysql_query($query);
	while($data = mysql_fetch_array($result))
	{

	echo"<h1>".$data['nom']."</h1>";
	
	echo"<border></border>";
	echo"<h2>".$data['abreviation']." - n° ".$data['id']." - ".$data['pays']."</h2>";
	echo"<border></border>";
	echo"<h3>Mail CT : ".$data['mail_ct']."</h3>";
	echo"<h3>Téléphone CT : ".$data['tel_ct']."</h3><br>";
	echo"<h3>Mail LT : ".$data['mail_lt']."</h3>";
	echo"<h3>Téléphone LT : ".$data['tel_lt']."</h3><br>";

	if(!empty($data['skype']))
	{
		echo'<script type="text/javascript" src="http://cdn.dev.skype.com/uri/skype-uri.js"></script>
	<div id="genSkypeCall_01">
	    <script type="text/javascript">
		Skype.ui({
		    name: "call",
		    element: "genSkypeCall_01",
		    participants: ["'.$data['skype'].'"],
		    imageSize: 32,
		    imageColor: "skype"
		});
	    </script>
	</div>';
	echo "<h3>Skype : ".$data['skype']."</h3>";
	}
	else
	{
		echo "Le Skype du partenaire n'a pas été indiqué";
	}

	echo"<h3>Adresse postale : </h3>";
	echo"<h3>".$data['adresse']."</h3><br>";
	if($data['attention'] == 1)
	{
		echo"<div class='error'>Attention ! Ce Partenaire n'est pas fiable !</div>";
	}
	else
	{
		echo"<h3>Le Partenaire semble fiable.</h3>";
	}
	

	echo"<h2>Commentaires</h2>";
	echo"<p>".nl2br($data['commentaires'])."</p><br>";
	echo"<a href='index.php?page=edit_partenaire&id=".$data['id']."'>modifier</a> - ";
	echo"<a style='cursor: pointer;' onclick=\"if (window.confirm('Etes-vous sûr(e) de vouloir supprimer ce partenaire ?')) 
{location.href='index.php?page=delete_partenaire&id=".$id."';return true;} else {return false;}\">supprimer</a>";

	}

?>
