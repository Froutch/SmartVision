<div class='add_partenaire'>
	<h1>Ajouter un Volontaire</h1>
	<border></border>
	<h2>Champs obligatoires</h2>
	<form action="" method="post">
	<input type="text" name="nom" placeholder="Nom" value="<?php echo $_GET['nom']; ?>" required>
	<input type="text" name="prenom" placeholder="Prénom" value="<?php echo $_GET['prenom']; ?>" required><br>
	<input type="text" name="date_naissance" id="popupDatepicker" placeholder="Date de Naissance" value="<?php echo $_GET['date_naissance']; ?>" required><br>
	<input type="text" name="mail" placeholder="Adresse E-Mail" required><br>
	Homme : <INPUT type=radio name="sexe" value="M" checked>
	<br>Femme : <INPUT type=radio name="sexe" value="F"><br>
	Nationalité :
	<select name="nationalite" style="width: 200px;">
	<?php
	$query = "SELECT langFR from countries ORDER BY langFR;";
	$result = mysql_query($query);
 	while($data = mysql_fetch_array($result))
	{
		echo "<option>".$data['langFR']."</option>";
	}

	?>

	</select>	
	<br>
	<input type="text" name="mobile" placeholder="Téléphone Mobile" required>
	<h2>Champs facultatifs</h2>
	<input type="text" name="fixe" placeholder="Téléphone Fixe">
	<input type="text" name="adresse" placeholder="Adresse postale" style="width: 500px;"><br>
	<TEXTAREA rows="3" name="commentaires" placeholder="Commentaires sur le Volontaire"></TEXTAREA><br>
	<input type="submit" value="ajouter"/>
</div>
