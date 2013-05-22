<!DOCTYPE HTML>
<html>
<body>
<FORM METHOD="POST" ACTION="./exsnmp.php">
<INPUT type="text" value="communaute" name="communaute">
<INPUT type="text" value="ip" name="ip">
<INPUT type="submit" value="Envoyer">
</FORM>
<?php
if (isset ($_POST['communaute']) && isset ($_POST['ip']))
{
	$var1 = $_POST['communaute'];
	$var2 = $_POST['ip'];
	$result = system("./infoRouteur.pl $var1 $var2");
	echo $result;
}
else
{
	echo "Veuillez remplir les champs";
}
?>
</body>
</html>
