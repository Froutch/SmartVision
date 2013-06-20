	<body>
	<center><h1>SmartVision file editing tool</h1></center>
	<br>
	
<?php
var_dump($_POST);
var_dump($_GET);

	if( !isset($_GET['f']) || !$_GET['f'] || strpos('/', $_GET['f']) || strpos('..', $_GET['f']) ) { }
	else $filename = $_GET['f'];
	
	if( !isset($_POST['f']) || !$_POST['f'] || strpos('/', $_POST['f']) || strpos('..', $_POST['f']) ) { }
	else $filename = $_POST['f'];
	

?>
<h3> Please enter here a file name </h3>

	<?php echo'<form method="POST" action="index.php?page=edit_config">'; ?>
	<input type="text" name="f" required> <br>
	
<fieldset>
	<label for="choices">
		<ul class="checklist">
			
			<input type="checkbox" name="add" />
			<li>
			<p>Click here to add file to favourite</p>
			</li>
		</ul>
	</label>

</fieldset>

	<input type="submit" value="Open file" />
</form>


	
<?php
	
	if (isset($_POST['script_modify'])) 
	{
		system("sudo perl perlScripts/create_dir.pl ".$filename." \"".$_POST['script_modify']."\"");
	}
	if (isset($_GET['add'])) 
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
