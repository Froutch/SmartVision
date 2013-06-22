<head>
    <meta name="viewport" content="width=device-width"/>
</head>
<center>
<?php
	require_once ("session.php");
	manage_session ();

	// Redirect the user to a page based on the user type

	if ( $user['type'] == 'M' ) redirect ("accounts.php");
	else if ( $user['type'] == 'A' ) redirect ("accounts.php");
	else redirect ("editaccount.php?accountid=$user[id]");
?>
<a href="../index.php?page=welcome">Back to SmartVision</a>
</center>