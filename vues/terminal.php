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
	echo "Welcome to your Shell ! Here are displayed the results of your requests.";
}
?>
	
		</code>
		</div>
<center>
<form action="index.php?page=terminal" method="POST">
<div data-role="fieldcontain">
<input type="text" name="req" id="name" data-role="none" placeHolder="request"  style="width: 80%" value="" required>
</div>
	<input type="submit" data-inline="true" value="Send" data-theme="b"/>
	</form>
	</center>
