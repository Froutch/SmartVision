<div class='recherche'>
<h1>Recherche</h1>
<border></border>
<h2>Volontaires</h2>
<form action='' name='form1' method='get'>
	<input type='hidden' name='page' value='recherche'/>
	<input type='hidden' name='recherche_vol' value='1'/>

<h3>Trier</h3>
	
<?php
	echo"<input name='id' type='text' autocomplete='off' value=\"".$_GET['id']."\" placeholder='N°' onKeyUp=\"suggest(this, 'volontaires', 'id');\" />";


	echo"<input name='nom' type='text' autocomplete='off' value=\"".$_GET['nom']."\" placeholder='Nom' onKeyUp=\"suggest(this, 'volontaires', 'nom');\" />";

	echo"<input name='prenom' type='text' autocomplete='off' value=\"".$_GET['prenom']."\" placeholder='Prénom' onKeyUp=\"suggest(this, 'volontaires', 'prenom');\" />";
	

?>







		<input type="text" name="date_naissance" id="popupDatepicker" value="<?php echo $_GET['date_naissance']; ?>" placeholder="Date de Naissance"><br>




<?php


	echo"<input name='mail' type='text' autocomplete='off' placeholder='Mail' value=\"".$_GET['mail']."\" onKeyUp=\"suggest(this, 'volontaires', 'mail');\" />";

?>
	<SELECT name='sexe' onchange="document.form1.submit();">
	<option value=''>Sexe</option>

<?php
	if($_GET['sexe'] == 'M')
	{
		echo"<option selected='selected'>M</option>";
	}
	else
	{
		echo"<option>M</option>";
	}
	if($_GET['sexe'] == 'F')
	{
		echo"<option selected='selected'>F</option>";
	}
	else
	{
		echo"<option>F</option>";
	}

?>
	</SELECT>


	<SELECT name='nationalite' onchange="document.form1.submit();">
	<option value='' >Nationalité</option>
<?php
	$query = 'SELECT DISTINCT nationalite FROM volontaires ORDER BY nationalite;';
	$result = mysql_query($query);
	while($data = mysql_fetch_array($result))
	{
		if($data['nationalite'] == $_GET['nationalite'])
		{
			echo "<option selected='selected'>".$data['nationalite']."</option>";
		}
		else
		{
			echo"<option value='".$data['nationalite']."'>".$data['nationalite']."</option>";
		}
	}


?>

	</SELECT>



	<SELECT name='pays' onchange="document.form1.submit();">
	<option value='' >Destination</option>
<?php
	$query = 'SELECT DISTINCT pays FROM missions ORDER BY pays;';
	$result = mysql_query($query);
	while($data = mysql_fetch_array($result))
	{
		if($data['pays'] == $_GET['pays'])
		{
			echo "<option selected='selected'>".$data['pays']."</option>";
		}
		else
		{
			echo"<option value='".$data['pays']."'>".$data['pays']."</option>";
		}
	}


?>

	</SELECT>
<br>
Age

<SELECT name='age_from' onchange="document.form1.submit();">
	<option value='' >de</option>
<?php

	for($i = 1 ; $i < 100 ; $i ++)
	{
		if($i == $_GET['age_from'])
		{
			echo "<option selected='selected'>".$i."</option>";
		}
		else
		{
			echo"<option value='".$i."'>".$i."</option>";
		}
	}


?>

	</SELECT>

<SELECT name='age_to' onchange="document.form1.submit();">
	<option value='' >à</option>
<?php

	for($i = 1 ; $i < 100 ; $i ++)
	{
		if($i == $_GET['age_to'])
		{
			echo "<option selected='selected'>".$i."</option>";
		}
		else
		{
			echo"<option value='".$i."'>".$i."</option>";
		}
	}


?>

	</SELECT>

<br>
<SELECT name='id_partenaire' onchange="document.form1.submit();">
	<option value='' >Partenaire</option>
<?php
	$query = 'SELECT id, abreviation FROM partenaires ORDER BY abreviation;';
	$result = mysql_query($query);
	while($data = mysql_fetch_array($result))
	{
		if($data['id'] == $_GET['id_partenaire'])
		{
			echo "<option selected='selected' value='".$data['id']."'>".$data['abreviation']."</option>";
		}
		else
		{
			echo"<option value='".$data['id']."'>".$data['abreviation']."</option>";
		}
	}
?>
	</SELECT>


<br>
Mission : 

	<label for="from">Du</label>
	<input type="text" id="from" name="from" value="<?php echo $_GET['from'];?>">
	<label for="to">Au</label>
	<input type="text" id="to" name="to" value="<?php echo $_GET['to'];?>"><br>



<h3>Afficher</h3>


<?php

echo"<input type='checkbox' name='display_id' value='1'";
if(isset($_GET['display_id']))
{
	echo ' checked';
}
echo"> N°";
?>



<?php

echo"<input type='checkbox' name='display_nom' value='1'";
if(isset($_GET['display_nom']))
{
	echo ' checked';
}
echo"> Nom";
?>

<?php

echo"<input type='checkbox' name='display_prenom' value='1'";
if(isset($_GET['display_prenom']))
{
	echo ' checked';
}
echo"> Prénom";
?>

<?php

echo"<input type='checkbox' name='display_mail' value='1'";
if(isset($_GET['display_mail']))
{
	echo ' checked';
}
echo"> Mail";
?>



<?php

echo"<input type='checkbox' name='display_fixe' value='1'";
if(isset($_GET['display_fixe']))
{
	echo ' checked';
}
echo"> N° Fixe";
?>

<?php

echo"<input type='checkbox' name='display_mobile' value='1'";
if(isset($_GET['display_mobile']))
{
	echo ' checked';
}
echo"> N° Mobile";
?>


<br>
<input type='submit' value='Rechercher'/>






</form>



<h2>Résultats</h2>
<border></border>




<?php

// la variable qui va contenir les données CSV
$outputCsv = '';


$i = 0;


if(!empty($result_vol))
{
	$nb_lignes = mysql_num_rows($result_vol);
	echo $nb_lignes." résultats trouvés";
	echo"<table>";
	echo"<tr>";
	echo"<th>Fiche complète</th>";
	foreach($data as $key2 => $value2)
	{
		if(isset($_GET['display_'.$key2]))
		{
			echo "<td>".$value2."</td>";
		} 
	}
	if(isset($_GET['display_id']))
	{
		echo "<th>N°</th>";
	}
	if(isset($_GET['display_nom']))
	{
		echo "<th>Nom</th>";
	} 
	if(isset($_GET['display_prenom']))
	{
		echo "<th>Prénom</th>";
	} 
	if(isset($_GET['display_mail']))
	{
		echo "<th>Mail</th>";
	} 
	if(isset($_GET['display_fixe']))
	{
		echo "<th>Tel fixe</th>";
	}
	if(isset($_GET['display_mobile']))
	{
		echo "<th>Tel mobile</th>";
	} 
	if(isset($_GET['display_abreviation']))
	{
		echo "<th>Partenaire</th>";
	} 
	echo"</tr>";

	while($data = mysql_fetch_assoc($result_vol))
	{
		

		foreach($data as $key => $value)
		{
			$data[$key] = str_replace ( ',', " ", $value);
		}
		$i++;

		// Si c'est la 1er boucle, on affiche le nom des champs pour avoir un titre pour chaque colonne
		if($i == 1)
		{
		    foreach($data as $clef => $valeur)
		        $outputCsv .= trim($clef).';';
			
		    $outputCsv = rtrim($outputCsv, ';');
		    $outputCsv .= "\n";
		}

		// On parcours $data et on ajout chaque valeur à cette ligne
		foreach($data as $clef => $valeur)
		    $outputCsv .= trim($valeur).';';

		// Suppression du ; qui traine à la fin
		$outputCsv = rtrim($outputCsv, ';');

		// Saut de ligne
		$outputCsv .= "\n";

		
		echo"<tr>";
		echo"<td><a href='index.php?page=volontaire&id=".$data['id']."'>Disponible</a></td>";

		
	
			foreach($data as $key2 => $value2)
			{
				if(isset($_GET['display_'.$key2]))
				{
					echo "<td>".$value2."</td>";
				} 
			}
		
		





		echo"</tr>";
	}
	echo"</table>";
}
else
{
	echo"<h3>Aucun résultat pour le moment</h3>";
}
echo"<form action='index.php?page=export_csv' method='POST'>";
echo"<input type='hidden' name='outputCsv' value=\"".$outputCsv."\"/>";
echo"<input type='submit' value='Export en .csv'/>";
echo"</form>";


?>




</div>
