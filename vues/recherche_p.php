<div class='recherche'>
<h1>Recherche</h1>
<border></border>
<h2>Partenaire</h2>
<form action='' name='form1' method='get'>
	<input type='hidden' name='page' value='partenaire'/>

<h3>Cliquez sur le partenaire de votre choix pour accéder à sa page :</h3>

<br>

	<SELECT name='id' onchange="document.form1.submit();">
	<option value=''>Partenaires</option>
<?php
	$query = 'SELECT DISTINCT * FROM partenaires ORDER BY nom;';
	$result = mysql_query($query);
	while($data = mysql_fetch_array($result))
	{
			echo"<option value='".$data['id']."'>".$data['nom']."</option>";
	}


?>

	</SELECT>
</form>





</div>
