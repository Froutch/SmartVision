<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SmartVision</title>
	<link rel="shortcut icon" href="design/favicon.ico">
	<link rel="stylesheet"  href="design/jquery.mobile.custom.css" />
	<link rel="stylesheet" href="design/jquery.mobile.custom.structure.css" />
	<link rel="stylesheet" href="design/jquery.mobile.custom.theme.css" />
	<script src="js/jquery-1.7.1.min.js"></script>

	<script src="js/jquery.mobile.custom.js"></script>
	
</head>
<body>
<!-- Barre d'outils qui ne s'affiche que lorsqu'on est connecté -->
<?php

if(!empty($_SESSION['id_admin']))
{

?>
<div data-role="header">
	<a href="index.php?page=welcome" data-role="button" data-theme="a" class="ui-btn-left">Home</a>
	<h1>SmartVision</h1>
	<a href="index.php?page=login_admin&disconnect=1" data-role="button" data-theme="a" class="ui-btn-right"><strong>X</strong> <?php echo ucwords($_SESSION['login']) ?></a>
</div>
<div data-role="navbar">
	<ul>
		<li><a href="index.php?page=config&host=localhost">MY SYSTEM</a></li>
<?php
$query = 'SELECT * FROM machines';
$result = mysql_query($query);
while($data = mysql_fetch_array($result))
{
		echo "<li><a href=''>".$data['ip']."</a></li>";
}
?>
	</ul>

</div><!-- /navbar -->

<?php

}
?>
