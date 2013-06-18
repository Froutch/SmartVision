<head>
    <meta name="viewport" content="width=device-width"/>
</head>

<?php

/************************************************************
	VIEW SYSTEM LOGS	
*/
require_once ("session.php");

/************************************************************
	Show the log information
*/
function show_log1 ()
{
	global $cmdLog1;
	$output = `$cmdLog1`;	
	log_output ($output);
}

/************************************************************
	Show the log information
*/
function show_log2 ()
{
	global $cmdLog2;
	$output = `$cmdLog2`;	
	log_output ($output);
}

/************************************************************
	Show the log information
*/
function show_log3 ()
{
	global $cmdLog3;
	$output = `$cmdLog3`;	
	log_output ($output);
}

function log_output($in) {

	$java = "onmouseover=\"this.style.backgroundColor='#9999CC';\" onmouseout=\"this.style.backgroundColor='#FFFFCC';\" onclick=\"this.style.backgroundColor='#FFFFCC';\"";
	echo "<table border=1 class=\"accttable\">";	
	echo "<tr $java><td class=adminacct>";	
	//$in = ereg_replace("\r?\n\r?\n", "<p></p>", $in);
	
	if ($in == "") { 
		$in = "No Records Found.";
	}
	else {
		$in = ereg_replace("\r?\n", "</td></tr><tr $java><td class=adminacct>", $in);
	}
	echo "$in";
	//$in = "<p>".$in."</p>";
	echo "</td></tr>";	
	echo "</table>";	
	

}

/************************************************************
	Begin page
*/
manage_session ();

// User's can't run this page
if ( $user['type'] == 'U' )
	{
	error_page ("User not authorized for this page");
	}

// Get the log type
if ( ! isset ($_GET['type']) )
	{
	$type = 1;
	}
else
	{
	$type = $_GET['type'];
	}

// The template file calls the show_log () function
include ("templates/logs.template");

?>
