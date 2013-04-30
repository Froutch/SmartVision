<div class='recherche'>
<h1>Recherche</h1>
<border></border>
<h2>Missions</h2>
<form action='' name='form1' method='get'>
	<input type='hidden' name='page' value='recherche_m'/>
	<input type='hidden' name='recherche_m' value='1'/>

<h3>Trier</h3>
	
<?php
	echo"<input name='id' type='text' autocomplete='off' value=\"".$_GET['id']."\" placeholder='N°' onKeyUp=\"suggest(this, 'volontaires', 'id');\" />";


	echo"<input name='code_mission' type='text' autocomplete='off' value=\"".$_GET['code_mission']."\" placeholder='Code Mission' onKeyUp=\"suggest(this, 'missions', 'code_mission');\" />";
	

	

?>
<br>

	



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


	<label for="from">Du</label>
	<input type="text" id="from" name="from" value="<?php echo $_GET['from'];?>">
	<label for="to">Au</label>
	<input type="text" id="to" name="to" value="<?php echo $_GET['to'];?>"><br>


<?php

echo"<input type='checkbox' name='ap_pret' value='1'";
if(isset($_GET['ap_pret']))
{
	echo ' checked';
}
echo"> Projet archivé";
?>
<?php

echo"<input type='checkbox' name='annule' value='1'";
if(isset($_GET['annule']))
{
	echo ' checked';
}
echo"> Projet annulé";
?>

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

echo"<input type='checkbox' name='display_code_mission' value='1'";
if(isset($_GET['display_code_mission']))
{
	echo ' checked';
}
echo"> Code Mission";
?>

<?php
echo"<input type='checkbox' name='display_pays' value='1'";
if(isset($_GET['display_pays']))
{
	echo ' checked';
}
echo"> Pays";
?>

<?php
echo"<input type='checkbox' name='display_from' value='1'";
if(isset($_GET['display_from']))
{
	echo ' checked';
}
echo"> Début";
?>


<?php
echo"<input type='checkbox' name='display_to' value='1'";
if(isset($_GET['display_to']))
{
	echo ' checked';
}
echo"> Fin";
?>



<?php

echo"<input type='checkbox' name='display_abreviation' value='1'";
if(isset($_GET['display_abreviation']))
{
	echo ' checked';
}
echo"> Partenaire";


echo"<input type='checkbox' name='display_nom_vol' value='1'";
if(isset($_GET['display_nom_vol']))
{
	echo ' checked';
}
echo"> Nom du volontaire";
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
	if(isset($_GET['display_nom_vol']))
	{
		echo "<th>Nom du volontaire</th>";
	}
	if(isset($_GET['display_from']))
	{
		echo "<th>Début</th>";
	}
	if(isset($_GET['display_to']))
	{
		echo "<th>Fin</th>";
	} 
	if(isset($_GET['pays']))
	{
		echo "<th>Pays</th>";
	}
	if(isset($_GET['display_abreviation']))
	{
		echo "<th>Partenaire</th>";
	} 
	if(isset($_GET['display_code_mission']))
	{
		echo "<th>Code Mission</th>";
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
		echo"<td><a href='index.php?page=mission&id=".$data['id']."'>Disponible</a></td>";

		
	
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
