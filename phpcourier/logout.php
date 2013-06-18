<head>
    <meta name="viewport" content="width=device-width"/>
</head>

<?php
require_once ("session.php");
db_connect ();
if ( have_session_cookie () )
	{
	get_session_record (0);
	$logout_msg = "User $user[name] logged out.";
	}
else
	{
	$logout_msg = "User logged out";
	}
cleanup_session ();

include ("templates/logout.template");

?>
