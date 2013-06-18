<head>
    <meta name="viewport" content="width=device-width"/>
</head>

<?php

/************************************************************
	VIEW AND SELECT MAILBOXES TO EDIT
*/
require_once ("session.php");

/************************************************************
	Draw the mailbox form. This is called from the
	mailboxes template.
*/

function mailbox_form ()
{
	global $mbx_handle, $mlimit, $user;

	if ( $user['type'] != 'U' || mysql_num_rows ($mbx_handle) < $mlimit )
		{
		echo "<table class=\"createtbl\"><tr><td>";
		echo "<a class=create href=\"editmbx.php?mbx=new&account=$_GET[accountid]\">";
		echo "Create New Mailbox</a>";
		echo "</td></tr></table>";
		}
}

/************************************************************
	Fetch the mailbox list from the query and call the
	template to display them.
*/
function mailbox_list ()
{
	global $mbx_handle, $table;

	// Load all the ids and names into an array
	$mbxlist = array ();
	while ( $row = mysql_fetch_row ($mbx_handle) )
		{
		$box = array ();
		$box['id']        = $row[0];
		$box['name']      = $row[1];
		$box['domain']    = $row[2];
		$box['clearpass'] = $row[3];
		$box['fullname']  = $row[4];
		
		$mbxlist[] = $box;
		}

	// Now step through each mailbox and get the aliases
	foreach ($mbxlist as $m)
		{
		$id = $m['id'];
		$name = $m['name'];
		$domain = $m['domain'];
		$clearpass = $m['clearpass'];
		$fullname = $m['fullname'];
		$link = "editmbx.php?mbx=$id";

		$aliases = array ();
		$query = "SELECT Alias FROM $table[aliases] WHERE MailboxId = '$id';";
		$local_handle = do_query ($query);
		while ( $row = mysql_fetch_row ($local_handle) )
			{
			$aliases[] = $row[0];
			}

		include ("templates/mailbox_item.template");
		}
}

/************************************************************
	Do the forwards for this user
*/
function mailbox_forwards ()
{
	global $fwd_handle, $table;

	while ( $row = mysql_fetch_row ($fwd_handle) )
		{
		$link = "editaccount.php?accountid=$_GET[accountid]";
		$from = $row[0];
		$to = $row[1];
		include ("templates/mailbox_fwditem.template");
		}
}

/************************************************************
	Begin page
*/
manage_session ();

// Don't do anything if the account is not set
if ( ! isset ($_GET['accountid']) )
	{
	error_page ("Account number not set");
	}

// Make sure user doesn't try to edit someone else
if ( $user['type'] == 'U' )
	{
	if ( $user['id'] != $_GET['accountid'] )
		{
		error_page ("You can only edit your own mailboxes.");
		}
	}

// Do a query to get the account name and mailbox limit
$query = 
	"SELECT AccountName, MailboxLimit " .
	"FROM $table[accounts] " .
	"WHERE AccountId = '$_GET[accountid]';";	
$query_handle = do_query ($query);
$row = mysql_fetch_row($query_handle);
$accountname = $row[0];
$accountid   = $_GET['accountid'];
$mlimit = $row[1];

// Mailbox query
$query =
	"SELECT M.MailboxId, M.MailboxName, D.DomainName, M.ClearPass, M.FullName " .
	"FROM $table[mailboxes] AS M, $table[domains] AS D " .
	"WHERE M.AccountId = '$_GET[accountid]' " .
	"AND   M.DomainId = D.DomainId";
$mbx_handle = do_query ($query);

// Check for the one and only one case
if ( $user['type'] == 'U' && mysql_num_rows ($mbx_handle) == 1 && $mlimit == 1 )
	{
	$row = mysql_fetch_row ($mbx_handle);
	redirect ("editmbx.php?mbx=$row[0]");
	}

// Forwards query
$query  =
	"SELECT FromAddress, ToAddress " .
	"FROM $table[forwards] " .
	"WHERE AccountId = '$_GET[accountid]';";
$fwd_handle = do_query ($query);
	
$mbx_rows = mysql_num_rows ($mbx_handle);
$fwd_rows = mysql_num_rows ($fwd_handle);

// The template file calls mailbox_list ()
include ("templates/mailboxes.template");

?>
