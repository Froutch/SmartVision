<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="fr" />
		<title>
			SmartConfig HD
		</title>
	</head>
	<body>

	<?php  ?>
	<h1>Page de configuration de Bind</h1>
	<br>
	
<?php
	if( !isset($_GET['f']) || !$_GET['f'] || strpos('/', $_GET['f']) || strpos('..', $_GET['f']) ) $filename = 'named.conf.local';
	else $filename = $_GET['f'];

	
	$lien = "/etc/bind/".$filename;

	if (isset($_POST['script_modify'])) 
	{
		system("sudo perl perlScripts/create_dir.pl ".$lien." \"".$_POST['script_modify']."\"");
		echo $_POST['script_modify'];
	}
	
	echo "<h3>/etc/bind/".$filename."</h3>";
	
	system("sudo ls /etc/bind > /var/www/salman/vues/ls_etc_bind.txt");
	$handle = @fopen("/var/www/salman/vues/ls_etc_bind.txt", "r");
	if ($handle) 
	{
		echo "<select onChange='change_file()' id='selectOpt'>";
		while (($buffer = fgets($handle, 4096)) !== false) 
		{
			$buffer = substr($buffer,0,-1);
			echo "<option value='".$buffer."'";
			
			if($buffer == $filename) echo " selected='selected' ";
			echo ">".$buffer."</option>";
		}
		echo"</select>";
		if (!feof($handle)) 
		{
			echo "Erreur: fgets() a échoué\n";
		}
		fclose($handle);
	}
?>
<script> 
	var myselect = document.getElementById("selectOpt");
	
	function change_file() 
	{
		var newFile=myselect.value;
		var originalUrl=location.protocol + '//' + location.host + location.pathname;
		document.location.href=originalUrl+'?page=bind_config&f='+newFile;
	}
</script>
	
	<?php echo'<form method="post" action="index.php?page=bind_config&f='.$filename.'">'; ?>
		<textarea name="script_modify" cols="70" rows="30"><?php $contenu = fread(fopen($lien, "r"), filesize($lien)); print $contenu; ?></textarea>
		<input type='submit' value='Modifier' />
	</form>

	</body>

</html>
