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
	<h1>Page de configuration de Courier IMAP et POP</h1>
	<br>
	  <?php
        echo '<form method="post" action="index.php?page=courier_config">';?>
        <input type="submit" value="Restart Courier-IMAP" name="courierimaprestart">
        </form>
<?php
        if( isset($_POST['courierimaprestart']))
        {
		$affiche = "/var/www/salman/vues/courierrestart.txt";
		system("sudo perl perlScripts/bind_restart.pl ".$affiche." \"/etc/init.d/courier-imap restart\"");
		$contenu2 = fread(fopen($affiche, "r"), filesize($affiche)); print $contenu2;
        }
        ?>
        <br>
          <?php
        echo '<form method="post" action="index.php?page=courier_config">';?>
        <input type="submit" value="Restart Courier-POP" name="courierpoprestart">
        </form>
<?php
        if( isset($_POST['courierpoprestart']))
        {
                $affiche = "/var/www/salman/vues/courierrestart.txt";
                system("sudo perl perlScripts/bind_restart.pl ".$affiche." \"/etc/init.d/courier-pop restart\"");
                $contenu2 = fread(fopen($affiche, "r"), filesize($affiche)); print $contenu2;
        }
        ?>
	
<?php
	if( !isset($_GET['f']) || !$_GET['f'] || strpos('/', $_GET['f']) || strpos('..', $_GET['f']) ) $filename = 'authmysqlrc';
	else $filename = $_GET['f'];

	
	$lien = "/etc/courier/".$filename;

	if (isset($_POST['script_modify'])) 
	{
		system("sudo perl perlScripts/create_dir.pl ".$lien." \"".$_POST['script_modify']."\"");
	}
	
	echo "<h3>/etc/courier/".$filename."</h3>";
	
	system("sudo perl perlScripts/exec_cmd.pl \"ls /etc/courier > /var/www/salman/vues/ls_etc_courier.txt\"");
	$handle = @fopen("/var/www/salman/vues/ls_etc_courier.txt", "r");
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
		document.location.href=originalUrl+'?page=courier_config&f='+newFile;
	}
</script>
	
	<?php echo'<form method="post" action="index.php?page=courier_config&f='.$filename.'">'; ?>
		<textarea maxlength="10000" name="script_modify" cols="70" rows="30"><?php $contenu = fread(fopen($lien, "r"), filesize($lien)); print $contenu; ?></textarea>
		<input type='submit' value='Modifier' />
	</form>

	</body>

</html>
