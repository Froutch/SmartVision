<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
        <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
                <meta http-equiv="Content-Language" content="fr" />
                <head>
    <?php
      if ((strlen($Soa) > 0) && (strlen($Ns) > 0) && (strlen($Aweb) > 0) && (strlen($Mx) > 0))
        echo "<meta http-equiv='refresh' content='0; url=djbdns_config.php?Soa=$Soa&Ns=$Ns&Aweb=$Aweb&Mx=$Mx'>";
    ?>
  <title>Saisie des donnéees</title>
  </head>
        </head>
        <body>
<form name="MonFormulaire" method="post" action="index.php?page=djbdns_config&f=">
  Enregistrement NS :
  <?
    if (($Espion == "JaiToutVu") && (strlen($Soa) == 0))
    echo "VIDE";
  ?>
  <input type="text" name="Soa" value=<?php echo $Soa;?>>
  <br>
  <!----------------------------------->
  Adresse IP :
  <?
    if (($Espion == "JaiToutVu") && (strlen($Ns) == 0))
    echo "VIDE";
  ?>
  <input type="text" name="Ns" value=<?php echo $Ns;?>>
   <br>
 Nom assosie :
  <?
    if (($Espion == "JaiToutVu") && (strlen($Aweb) == 0))
    echo "VIDE";
  ?>
  <input type="text" name="Aweb" value=<?php echo $Aweb;?>>
  <br>
 Timeout :
  <?
    if (($Espion == "JaiToutVu") && (strlen($Mx) == 0))
    echo "VIDE";
  ?>
  <input type="text" name="Mx" value=<?php echo $Mx;?>>
  <br>
 
<input type="hidden" name="Espion" value="JaiToutVu">
  <input type="submit" name="Submit" value="Envoyer">
</form>
	</body>
</html>
