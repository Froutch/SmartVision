<head>
    <meta name="viewport" content="width=device-width"/>
</head>

<?php

/************************************************************
	SESSION CONTROL FUNCTIONS
*/
require_once ("globals.php");

/************************************************************
	Simple boolean function. Is the session cookie set?
*/
function have_session_cookie ()
{
	global $session;

	if (  isset ($_COOKIE[$session['cookie_name']]) &&
          $_COOKIE[$session['cookie_name']] != "no session" )
		{
		return true;
		}
	else
		{
		return false;
		}
}

/************************************************************
	Return the session id from the cookie.
*/
function get_session_name ()
{
	global $session;

	if ( have_session_cookie () )
		{
		return $_COOKIE[$session['cookie_name']];
		}
	else
		{
		return "no session";
		}
}


/************************************************************
	Draw a link to a help topic.
*/
function help ($text, $topic)
{
	return 
		"<span style=\"cursor:help\" " .
   		"onclick=\"loadhelp('$topic');\">$text</span>";
}

/************************************************************
	Draw a generic error page. This is used by many
	functions.
*/
function error_page ($error_msg)
{
	include "templates/error.template";
	exit ();
}

/************************************************************
	Draw the login page. The login page includes a callback
	to draw the login form.
*/
function login_page ($login_msg)
{
	include "templates/login.template";
	exit ();
}

/************************************************************
	Draw the login form. This is called from the
	login template
*/
function login_form ()
{
	echo "<br><br><center><form action=\"$_SERVER[PHP_SELF]\" method=\"post\">";
	echo "<input type=\"hidden\" name=\"action\" value=\"login\">";

	// Carry any parameters forward to this form so they are resubmitted
	foreach ($_POST as $k => $v)
		{
		if ( $k != "loginname" && $k != "password" )
			{
			if ( is_array ($v) )
				{
				foreach ($v as $a)
					{
					$keyname = $k . "[]";
					echo "<input type=\"hidden\" name=\"$keyname\" value=\"$a\">";
					}
				}
			else
				{
				echo "<input type=\"hidden\" name=\"$k\" value=\"$v\">";
				}
			}
		}

	echo "<table>";

	echo "<tr><td>Account Name</td>";
	echo "<td><input type=\"text\" name=\"loginname\" size=\"25\"></td>";
	echo "</tr>";

	echo "<tr><td>Password</td>";
	echo "<td><input type=\"password\" name=\"password\" size=\"25\"></td>";
	echo "</tr>";

	echo "<tr><td colspan=\"2\">";
	echo "<input type=\"submit\" name=\"login\" value=\"Login\">";
	echo "</td></tr>";

	echo "</table>";
	echo "</form></center>";
}

/************************************************************
	Open a connection to the database.
*/
function db_connect ()
{
	global $mysql;

	// Connect
	if ( ! @mysql_connect 
			($mysql['host'], $mysql['username'], $mysql['password']) )
		{
		error_page ("Unable to establish a connection to the " .
					"MySQL database.<br>" . mysql_error());
		}
	
	// Select the database
	if ( ! @mysql_select_db ($mysql['database']) )
		{
		error_page ("Error selecting database $mysql[database].<br>" .
					mysql_error());
		}
}

/************************************************************
	Perform a mysql query. Print an error page and exit
	if there is an error.
*/
function do_query ($query)
{
	$handle = @mysql_query ($query);
	if ( ! $handle )
		{
		error_page ("Database error.<hr>Query String:<br>" .
			"<blockquote>$query</blockquote>" .
			"<hr>Error:<br><blockquote>" . mysql_error () .
			"</blockquote>");
		}
	return $handle;
}

/************************************************************
	Redirect. Creates a redirect page to the destination
	given by $url.
*/
function redirect ($url)
{
	header ("Location: $url");
	exit ();
}

/************************************************************
	Check that the given username and password is valid.
*/
function valid_login ($name, $pwd)
{
	global $table, $user, $session;

	// Seleect from the account table
	$query = 
		"SELECT AccountId, AccountName, AccountType, DomainId " .
		"FROM $table[accounts] " .
		"WHERE AccountName = '$name' AND CryptPass = PASSWORD('$pwd') " .
		"AND Active = 'true';";
	$handle = do_query ($query);

	$row = mysql_fetch_row ($handle);
	if ( ! $row ) { return false; }

	$user['id']		= $row[0];
	$user['name']	= $row[1];
	$user['type']	= $row[2];
	$user['domain']	= $row[3];
	
	$user['expire']	= time() + $session['expire_sec'];

	return true;
}

/************************************************************
	Create a new session record and set the cookie.
*/
function create_session ()
{
	global $table, $user, $session;

	// Generate a random key
	$seed = time () . "-" . rand ();
	$key = md5 ($seed);

	// Delete all session records for this user
	$query = 
		"DELETE FROM $table[sessions] " .
		"WHERE AccountId = '$user[id]';";
	do_query ($query);

	// Create the session record
	$query = 
		"INSERT INTO $table[sessions] " .
		"(SessionKey, AccountId, AccountName, AccountType, DomainId, Expiration) " .
		"VALUES " .
		"('$key', '$user[id]', '$user[name]', '$user[type]', '$user[domain]', '$user[expire]');";
	do_query ($query);

	// Now set the cookie
	setcookie ($session['cookie_name'], $key);
}

/************************************************************
	Retrieve the session record.
*/
function get_session_record ($login)
{
	global $session, $table, $user;

	$key = get_session_name ();

	$query = 
		"SELECT AccountId, AccountName, AccountType, DomainId, Expiration " .
		"FROM $table[sessions] " .
		"WHERE SessionKey = '$key';";
	$handle = do_query ($query);

	$row = mysql_fetch_row ($handle);
	if ( ! $row )
		{
		setcookie ($session['cookie_name'], "no session");
		if ( $login )
			{
			login_page ("Invalid session key. Login to continue.");
			}
		else
			{
			// Don't set the user type. $login is only false
			// when called from the logout page.
			return;
			}
		}

	// Set the user information
	$user['id']		= $row[0];
	$user['name']	= $row[1];
	$user['type']	= $row[2];
	$user['domain']	= $row[3];
	$user['expire']	= $row[4];
}

/************************************************************
	Recompute the new expire time and update the
	session record.
*/
function update_session_expire ()
{
	global $session, $table, $user;

	// Get the session key
	$key = get_session_name ();
	
	// Compute new expiration time
	$user['expire'] = time () + $session['expire_sec'];

	$query =
		"UPDATE $table[sessions] " .
		"SET Expiration = '$user[expire]' " .
		"WHERE AccountId = '$user[id]';";
	do_query ($query);
}

/************************************************************
	Clean up and delete the current session
*/
function cleanup_session ()
{
	global $session, $table;

	if ( ! have_session_key ) { return; }
	$key = get_session_name ();

	// Change the cookie name
	setcookie ($session['cookie_name'], "no session");

	// Delete the session record
	$query = 
		"DELETE FROM $table[sessions] " .
		"WHERE SessionKey = '$key';";
	do_query ($query);
}

/************************************************************
	This function is called at the top of every page.
	It performs the session maintenance functions and
	connects to the database.
*/
function manage_session ()
{
	global $session, $user;

	// Connect to the database
	db_connect ();

	// Look for results from a login form
	if ( $_POST['action'] == "login" )
		{
		// If a cookie is already set, make sure the new
		// login name matches the one from the session
		if ( have_session_cookie () )
			{
			get_session_record (1);
			if ( $_POST['loginname'] != $user['name'] )
				{
				setcookie ($session['cookie_name'], "no session");
				error_page ("Session belongs to $user[name]<br>".
							"<a href=\"index.php\">Begin a new session</a>");
				}
			}
	
		// Make sure the login is valid. This also fills in the $user array.
		if ( ! valid_login ($_POST['loginname'], $_POST['password']) )
			{
			login_page ("Username or password is invalid.");
			}

		// Create a new session
		create_session ();
		}
	elseif ( have_session_cookie () )
		{
		// Retrieve the session record
		get_session_record (1);

		// Check if it is expired
		$now = time ();
		if ( $now > $user['expire'] )
			{
			login_page ("Session expired. Login to continue");
			}
		else
			{
			update_session_expire ();
			}
		}
	else
		{
		// No cookie - no form - just login
		login_page ("Begin a new session.");
		}
}

/** 
   NAME        : convert_from_bytes() 
   VERSION     : 1.0 
   AUTHOR      : J de Silva 
   DESCRIPTION : returns FLOAT value; handles converting 
                 bytes to values in units between 
                 'bits' and 'gigabytes'. 
   TYPE        : function 
   ======================================*/ 

function convert_from_bytes( $bytes, $to=NULL ) 
{ 
  $float = floatval( $bytes ); 
  switch( $to ) 
  { 
    case 'Kb' :            // Kilobit 
      $float = ( $float*8 ) / 1024; 
      break; 
    case 'b' :             // bit 
      $float *= 8; 
      break; 
    case 'GB' :            // Gigabyte 
      $float /= 1024; 
    case 'MB' :            // Megabyte 
      $float /= 1024; 
    case 'KB' :            // Kilobyte 
      $float /= 1024; 
    default :              // byte 
  } 
  unset( $bytes, $to ); 
  return( $float ); 
} 

?>
