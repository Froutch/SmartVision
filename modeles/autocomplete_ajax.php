<?php
/******************************************
# Auteur : Julien Theler - www.twiip.ch
# Contact : julien.theler@twiip.ch
# Licence : CC-by-nc
******************************************/



//Sécurité pour empêcher d'interroger la base librement : liste des table et des champs utilisables
$check = array(
	'volontaires' => array('nom', 'prenom', 'mail', 'id'),
		'missions' => array('code_mission')
);

//Connexion à la base de données
@mysql_connect('mysql51-11.business', 'servicevlmgst', 'gestion00') or die('Connexion à la base de données impossible');
@mysql_select_db('servicevlmgst') or die('base de données inexistante');

$table = (isset($_GET['table']) ? $_GET['table'] : '');
$field = (isset($_GET['field']) ? $_GET['field'] : '');
$search = (isset($_GET['search']) ? $_GET['search'] : '');

if(isset($check[$table]) && in_array($field, $check[$table])){ //Vérification
	if($table && $field && $search){
		$search = strtolower(mysql_escape_string($search));

		header("content-type: application/xml");
		echo '<?xml version="1.0" encoding="iso-8859-1" ?>';
		echo '<suggests>';
		
		$query = 'SELECT `'.$field.'` FROM `'.$table.'` WHERE lower(`'.$field.'`) LIKE "'.$search.'%" ORDER BY `'.$field.'`';
		$result = mysql_query($query);
		while($row = mysql_fetch_array($result)){
			echo '	<suggest>'.$row[$field].'</suggest>';
		}
		
		echo '</suggests>';
	}
}
else{
	die('Requête interdite');
}
?>
