<div class='add_partenaire'>
	<h1>Options</h1>
	<border></border>
	<form action='' method='post'>
	<input type='hidden' name='page' value='recherche'/>
	<input type='hidden' name='options' value='1'/>
	<?php
	$query = 'SELECT * FROM admins WHERE id='.$_SESSION['id'];
	$result = mysql_query($query);
	while($data = mysql_fetch_array($result))
	{
		
		echo"<input type='text' name='login' placeholder='Login' value=\"".$data['login']."\" required>";
		echo"<input type='text' name='mdp' placeholder='MDP actuel' value=\"".$data['mdp']."\" required><br>";
		echo"<input type='text' name='date_naissance' id='popupDatepicker' placeholder='Date de Naissance' value=\"".$data['date_naissance']."\" required><br>";
		echo"<input type='text' name='mail' placeholder='Adresse E-Mail' value=\"".$data['mail']."\" required><br>";
		echo"Homme : <INPUT type=radio name='sexe' value='M' ";
		if($data['sexe'] == 'M')
		{
			echo"checked";
		}
		echo">";
		echo"<br>Femme : <INPUT type=radio name='sexe' value='F' ";
		if($data['sexe'] == 'F')
		{
			echo"checked";
		}
		echo">";
		echo"<br>";
		echo"Nationalité :";
		echo"<select name='nationalite' style='width: 200px;'>";

		$query2 = 'SELECT langFR from countries ORDER BY langFR;';
		$result2 = mysql_query($query2);
	 	while($data2 = mysql_fetch_array($result2))
		{
			if($data['nationalite'] == $data2['langFR'])
			{
				echo "<option selected='selected'>".$data2['langFR']."</option>";
			}
			else
			{
				echo '<option>'.$data2['langFR'].'</option>';
			}
		}

	}

	echo"</select>";

	echo"<h2>Champs facultatifs</h2>";



	$query = 'SELECT * FROM volontaires_facultatif WHERE id_vol='.$id;
	$result = mysql_query($query);
	while($data = mysql_fetch_array($result))
	{
		echo"<input type='text' name='fixe' placeholder='Téléphone Fixe' value=\"".$data['fixe']."\">";
		echo"<input type='text' name='mobile' placeholder='Téléphone Mobile' value=\"".$data['mobile']."\">";
		echo"<input type='text' name='adresse' placeholder='Adresse postale' style='width: 500px;' value=\"".$data['adresse']."\"><br>";
		echo"<TEXTAREA rows='3' name='commentaires' placeholder='Commentaires sur le Volontaire'>".$data['commentaires']."</TEXTAREA><br>";
		echo"<input type='submit' value='ajouter'/>";
	}
	echo"</div>";
