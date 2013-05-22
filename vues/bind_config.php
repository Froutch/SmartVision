<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="fr" />
		<meta name="author" content="Marc Glisse" />
		<title>
			Squelette
		</title>
		
		<script> 

//		var myselect = document.getElementById("selectOpt");
	
	function change_file() {
		alert("lol");
		//var newFile=myselect.value;
		//var originalUrl=location.protocol + '//' + location.host + location.pathname;
		//document.location.href=originalUrl+'?page=bind_config&f='+newFile;
	}
	
</script>
	</head>
	<body>

	<?php  ?>
	<h1>Page de configuration de Bind</h1>
	<br><br>
	<h3>/etc/bind/</h3>
  <?php
	
	if( !isset($_GET['f']) || !$_GET['f'] || strpos('/', $_GET['f']) || strpos('..', $_GET['f']) )
	{
		$filename = 'named.conf.local';
	} else {
		$filename = $_GET['f'];
	}
  
	system("ls /etc/bind > ls_etc_bind.txt");
	$handle = @fopen("/var/www/salman/vues/ls_etc_bind.txt", "r");
	if ($handle) 
	{
		echo "<select onChange=\"change_file()\" id=\"selectOpt\">";
		while (($buffer = trim(fgets($handle, 4096))) !== false) 
		{
 			echo "<option value=\"".$buffer."\" ";
			if( $buffer == $filename ) echo "selected=\"selected\"";
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

	
	<form method="post" action="bind_config.php">
		<textarea name="precisions" id="precisions" cols="70" rows="30">
			<?php echo system("cat /etc/bind/".$filename.""); ?>
	</textarea>
	</form>
	<br><hr><br>

	</form>
	</body>
	

</html>

