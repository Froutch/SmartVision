<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <meta http-equiv="Content-Language" content="fr" />
                <title>
                        Djbdns
                </title>
        </head>
        <body>

        <h1>Page de configuration de Djbdns</h1>
        <br>
	<?php
        echo '<form method="post" action="index.php?page=djbdns_config">';?>
        <input type="submit" value="Restart Djbdns" name="djbdnsrestart">
        </form>

<h3> Etat du DNS </h3>
<?php echo system("dig"); ?>

<?php
        if( isset($_POST['djbdnsrestart']))
        {
                $affiche2 = "/var/www/alex/vues/djbdnsrestart.txt";
                system("sudo perl perlScripts/djbdns_restart.pl ".$affiche2." \"svc -u /service/tinydns\"");
                $contenu2 = fread(fopen($affiche2, "r"), filesize($affiche2)); print $contenu2;
        }
        ?>

<?php
	$lien = "/etc/tinydns/root/data";

	if (isset($_POST['script_modify']))
	{
		system("sudo perl perlScripts/create_dir.pl ".$lien." \"".$_POST['script_modify']."\"");
	}

	echo "<h3>/etc/tinydns/root/data</h3>";?>
        
	 <?php echo'<form method="post" action="index.php?page=djbdns_config&f='.$filename.'">'; ?>
                <textarea name="script_modify" cols="70" rows="30"><?php $contenu = fread(fopen($lien, "r"), filesize($lien)); print $contenu; ?></textarea>
	        <input type='submit' value='Modifier' /> </form>
        <br><hr><br>

        </form>
        </body>
</html>

