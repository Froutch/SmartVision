<head>
    <meta name="viewport" content="width=device-width"/>
</head>

<?php
require_once ("session.php");
manage_session ();

// Redirect the user to a page based on the user type

if ( $user['type'] == 'M' )
	{
	redirect ("accounts.php");
	}
elseif ( $user['type'] == 'A' )
	{
	redirect ("accounts.php");
	}
else
	{
	redirect ("editaccount.php?accountid=$user[id]");
	}

echo "<a href="../index.php?page=welcome"<input type="button" value="Bouton"> Back to SmartVision</a>"

?>
