<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <meta http-equiv="Content-Language" content="fr" />
                <title>
                        DHCP Config HD
                </title>
        </head>
        <body>

        <h1>Page de configuration DHCP </h1>
        <br>
        <?php
        echo '<form method="post" action="index.php?page=dhcp_config">';?>
        <input type="submit" value="Restart dhcp" name="dhcprestart">
        </form>
<?php
        if( isset($_POST['dhcprestart']))
        {
                $affiche3 = "/var/www/alex/vues/dhcprestart.txt";
                system("sudo perl perlScripts/dhcp_restart.pl ".$affiche3." \"svc -u /service/tinydns\"");
                $contenu3 = fread(fopen($affiche3, "r"), filesize($affiche3)); print $contenu3;
        }
        ?>

<?php
        $lien = "/etc/dhcp/dhclient.conf";

        if (isset($_POST['script_modify']))
        {
                system("sudo perl perlScripts/create_dir.pl ".$lien." \"".$_POST['script_modify']."\"");
        }

        echo "<h3>/etc/dhcp/dhclient.conf</h3>";?>

         <?php echo'<form method="post" action="index.php?page=dhcp_config&f='.$filename.'">'; ?>
                <textarea name="script_modify" cols="70" rows="30"><?php $contenu3 = fread(fopen($lien, "r"), filesize($lien)); print $contenu3; ?></textarea>
                <input type='submit' value='Modifier' /> </form>
        <br><hr><br>

        </form>
        </body>
</html>


