<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <meta http-equiv="Content-Language" content="fr" />
                <meta name="author" content="Marc Glisse" />
                <title>
                        Djbdns
                </title>

        </head>
        <body>


        <h1>Page de configuration de Djbdns</h1>
        <br>
	<input type="submit" value="Restart Djbdns">
  <?php

        if( !isset($_GET['f']) || !$_GET['f'] || strpos('/', $_GET['f']) || strpos('..', $_GET['f']) )
        {
                $filename = 'add-alias';
        } else {
                $filename = $_GET['f'];
        }
        if (isset($_POST['script_modify']))
        {
                system("sudo \"".$_POST['script_modify']."\" > ".$filename."");
        }
        echo "<h3>/etc/tinydns/root/".$filename."</h3>";

        system("sudo perl perlScripts/exec_cmd.pl \"ls /etc/tinydns/root > /var/www/salman/vues/ls_etc_tinydns_root.txt\"");

        $handle = @fopen("/var/www/alex/vues/ls_etc_tinydns_root.txt", "r");
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

        function change_file() {
                var newFile=myselect.value;
                var originalUrl=location.protocol + '//' + location.host + location.pathname;
                document.location.href=originalUrl+'?page=djbdns_config&f='+newFile;
        }

</script>
	 <?php echo'<form method="post" action="index.php?page=djbdns_config&f='.$filename.'">'; ?>
                <textarea name="script_modify" cols="70" rows="30"><?php echo system("cat /etc/tinydns/root/".$filename.""); ?></textarea>

	        <input type='submit' value='Modifier' /> </form>
        <br><hr><br>

        </form>
        </body>


</html>

