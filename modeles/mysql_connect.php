<?php
/*
	Connexion à la BDD MySQL. Effectue les changements pour toutes les requêtes.
*/
// on se connecte à MySQL
$host = 'localhost';
$user = 'root';
$password = 'pisvs4';
$db = mysql_connect($host, $user, $password)
    or die("Impossible de se connecter : " . mysql_error());
mysql_query("SET NAMES UTF8");
mysql_select_db('smartvision', $db);
?>
