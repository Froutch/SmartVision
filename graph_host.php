<?php session_start(); ?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SmartVision</title>
	<link rel="stylesheet"  href="jquery.mobile.custom.css" />
	<link rel="stylesheet" href="jquery.mobile.custom.structure.css" />
	<link rel="stylesheet" href="jquery.mobile.custom.theme.css" />
	<script src="//code.jquery.com/jquery-1.7.1.min.js"></script>

	<script src="jquery.mobile.custom.js"></script>
	
</head>
<body>

<div data-role="dialog">
	
		<div data-role="header" data-theme="d">
			<h1>Graphs</h1>

		</div>
		<div data-role="content" data-theme="c">

<center>

			<h2>Network Bandwidth</h2>
			<h3>Per Hour</h3>
<?php 

system("mkdir /var/www/".$_SESSION["machine_host"]."");
system("sudo rm /var/www/".$_SESSION["machine_host"]."/bandwidth.png");
system("sudo rm /var/www/".$_SESSION["machine_host"]."/bandwidthDAY.png");
system("sudo wget --directory-prefix='/var/www/".$_SESSION["machine_host"]."' ".$_SESSION["machine_host"]."/scripts/perlScripts/bandwidth.png");
system("sudo wget --directory-prefix='/var/www/".$_SESSION["machine_host"]."' ".$_SESSION["machine_host"]."/scripts/perlScripts/bandwidthDAY.png");

echo'<img src="/'.$_SESSION["machine_host"].'/bandwidth.png"/>'; ?>
<h3>Per Day</h3>
<?php echo'<img src="/'.$_SESSION["machine_host"].'/bandwidthDAY.png"/>'; ?>
</center>
<a data-role="button" data-rel="back" data-theme="a">Back</a>          
		</div>
	</div>


</body>
</html>










