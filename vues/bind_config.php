<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Content-Language" content="fr" />
		<meta name="author" content="Marc Glisse" />
		<title>
			Squelette
		</title>
	</head>
	<body>

	<?php  ?>
	<h1>Page de configuration de Bind</h1>
	<br><br>
	<h3>/etc/bind/
		  <?php
                system("ls /etc/bind > ls_etc_bind.txt");
                $handle = @fopen("/var/www/alex/vues/ls_etc_bind.txt", "r");
                        if ($handle) {
				        echo "<select>";
    					while (($buffer = fgets($handle, 4096)) !== false) {
       					 echo "<option>".$buffer."</option>";
   				 }
      				  echo"</select>";
   				 if (!feof($handle)) {
        				echo "Erreur: fgets() a échoué\n";

					}
   				 fclose($handle);
				}		
			?>

	</h3>
	<form method="post" action="bind_config.php">
		<textarea name="precisions" id="precisions" cols="70" rows="30">
			<?php echo system("cat /etc/bind/named.conf.local"); ?>
	</textarea>
	</form>
	<br><hr><br>

	</form>
	</body>
	

</html>

