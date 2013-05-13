<br>
<?php

/*	$result = mysql_query('SELECT * FROM terminal');
	while($data = mysql_fetch_array($result))
	{
		echo $data['id']." - ".$data['content']."</br>";
	}
*/
?>

<div class="ui-body ui-body-e"style="width: 80%; font-size: 1.3em; min-height: 300px; margin: auto;">
		<code>

<?php
if(!empty($_POST['req']))
{
	ob_start();
	passthru($_POST['req']);
	$var = ob_get_contents();
	ob_end_clean(); //Use this instead of ob_flush()
	$var = nl2br($var);
	echo $var;
}
else
{
	echo "Bienvenue sur le terminal de votre machine ! Ici s'afficheront les résultats de vos requêtes.";
}
?>
	
		</code>
		</div>
<center>
<form action="index.php?page=terminal" method="POST">
<div data-role="fieldcontain">
<input type="text" name="req" id="name" data-role="none" placeHolder="commande"  style="width: 80%" value="" required>
</div>
	<input type="submit" data-inline="true" value="Envoyer" data-theme="b"/>
	</form>
	</center>
