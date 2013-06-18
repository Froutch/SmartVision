<html>
<head>
    <meta name="viewport" content="width=device-width"/>
<style type = "text/css">
.helptext { font-family:sans-serif; font-size:10pt; color:#000066; }
</style>
</head>
<body>
<span class="helptext">

<?php

if ( $_GET['topic'] )
	{
	$file = "templates/help/$_GET[topic].php";

	if ( file_exists ($file) )
		{
		include "$file";
		}
	else
		{
		$topic = $_GET['topic'];
		include "templates/help/notfound.php";
		}
	}
else
	{
	include "templates/help/start.php";
	}

?>

</span>
</body>
</html>
