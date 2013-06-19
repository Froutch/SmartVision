<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="fr" />
		<script>
		$(document).ready(function() {
    $(".checklist .checkbox-select").click(
        function(event) {
            event.preventDefault();
            $(this).parent().addClass("selected");
            $(this).parent().find(":checkbox").attr("checked","checked");
        }
    );

    $(".checklist .checkbox-deselect").click(
        function(event) {
            event.preventDefault();
            $(this).parent().removeClass("selected");
            $(this).parent().find(":checkbox").removeAttr("checked");
        }
    );

});
		</script>
		<title>
			SmartEditor HD
		</title>
	</head>
	<body>
	<center><h1>SmartVision file editing tool</h1></center>
	<br>
<?php
	if( !isset($_GET['f']) || !$_GET['f'] || strpos('/', $_GET['f']) || strpos('..', $_GET['f']) ) $filename = "/etc/hosts";
	else $filename = $_GET['f'];
	
	if( !isset($_POST['f']) || !$_POST['f'] || strpos('/', $_POST['f']) || strpos('..', $_POST['f']) ) $filename = "/etc/hosts";
	else $filename = $_POST['f'];
?>
<h3> Please enter here a file name </h3>

	<?php echo'<form method="post" action="index.php?page=edit_config">'; ?>
	<input type="text" name="f" required> <br>
	
<fieldset>
	<label for="choices">
		<ul class="checklist">
			<li>
			<input type="checkbox" name="add"/>
			<p>Click here to add your file to favourite when opening it</p>
			</li>
		</ul>
	</label>
	<div style="clear: both;"></div>
</fieldset>

	<input type="submit" value="Open file" />
</form>

	
<?php
	
	if (isset($_POST['script_modify'])) 
	{
		system("sudo perl perlScripts/create_dir.pl ".$filename." \"".$_POST['script_modify']."\"");
	}
	if (isset($_POST['add'])) 
	{
		system("sudo perl perlScripts/exec_cmd.pl \"echo '".$filename."' >> /var/www/salman/vues/ls_etc_bind.txt\" ");
	}
	
	echo "<h3>".$filename."</h3>";
		
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
		document.location.href=originalUrl+'?page=edit_config&f='+newFile;
	}
</script>
	
	<?php echo'<form method="post" action="index.php?page=edit_config&f='.$filename.'">'; ?>
		<textarea name="script_modify" cols="70" rows="30"><?php $contenu = fread(fopen($filename, "r"), filesize($filename)); print $contenu; ?></textarea>
		<input type='submit' value='Apply' />
	</form>

	</body>

</html>
