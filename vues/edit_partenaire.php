<div class='add_partenaire'>
	<h1>Modifier un Partenaire</h1>
	<border></border>
	<h2>Champs obligatoires</h2>
	<?php
	$query = 'SELECT * FROM partenaires WHERE id='.$id;
	$result = mysql_query($query);
	while($data = mysql_fetch_array($result))
	{
		echo"<form action='' method='post'>";
		echo"Nom : <input type='text' name='nom' value=\"".$data['nom']."\" placeholder='Nom du Partenaire' required><br>";
		echo"Abréviation : <input type='text' name='abreviation' value=\"".$data['abreviation']."\" placeholder='Abréviation' required><br><br>";
		echo"Mail CT : <input type='text' name='mail_ct' value=\"".$data['mail_ct']."\" placeholder='Mail Court Terme' required><br>";
		echo"Tel CT : <input type='text' name='tel_ct' value=\"".$data['tel_ct']."\" placeholder='Téléphone Court Terme' required><br><br>";
		echo"Mail LT : <input type='text' name='mail_lt' value=\"".$data['mail_lt']."\" placeholder='Mail Long Terme' required><br>";
		echo"Tel LT : <input type='text' name='tel_lt' value=\"".$data['tel_lt']."\" placeholder='Téléphone Long Terme' required><br><br>";
		echo"Pays : ";
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

		echo"<h2>Champs facultatifs</h2>";

		echo"<div class='line'>";
		
		echo"	<input type='checkbox' ";
		if($data['attention']==1)
		{
			echo"checked='".$data['attention']."'";
		}
		echo"value='1' name='attention' />";
	
		echo"à suivre de près (partenaire peu fiable)";
		echo"</div>";
		echo"<br>";
		echo"Skype : <input type='text' name='skype' value=\"".$data['skype']."\" placeholder='Skype'><br>";
		echo"<input type='text' name='adresse' value=\"".$data['adresse']."\" placeholder='Adresse postale' style='width: 500px;'><br>";
		echo"<TEXTAREA rows='3' name='commentaires' placeholder='Commentaires sur le Partenaire'>".$data['commentaires']."</TEXTAREA><br>";
		echo"<input type='submit' value='modifier'/>";
	}
	?>
</div>
