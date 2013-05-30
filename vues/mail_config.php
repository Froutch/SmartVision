<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml$

<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <meta http-equiv="Content-Language" content="fr" />
                <title>
                        Dovecot
                </title>
        </head>
        <body>

        <h1>Page de configuration de Dovecot</h1>
        <br>
       
<?php
        $lien = "/etc/dovecot/dovecot.conf/";

        if (isset($_POST['script_modify']))
        {
                system("sudo perl perlScripts/create_dir.pl ".$lien." \"".$_POST['script_modif$
        }

        echo "<h3>/etc/dovecot/dovecot.conf/</h3>"; ?>

 <?php echo'<form method="post" action="index.php?page=mail_config&f='.$filename.'">'; ?>
                <textarea name="script_modify" cols="70" rows="30"><?php $contenu = fread(fopen($lien, "r"), filesize($lien)); print $contenu; ?></textarea>
                <input type='submit' value='Modifier' /> </form>

        <br><hr><br>

        </form>
        </body>
</html>
