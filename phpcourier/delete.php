<head>
    <meta name="viewport" content="width=device-width"/>
</head>

<?php

/************************************************************
	DELETE DOMAINS AND ACCOUNTS and all their table entries
*/
require_once ("session.php");

/************************************************************
	Global variables used in the delete functions
*/
global $errors, $errorcount, $deldir;

/************************************************************
	Draw a verification page to delete a domain
*/
function verify_domain_delete ($domainid, $domainname)
{
	$form  = "<form action=\"$_SERVER[PHP_SELF]\" method=\"post\">";
	$form .= "<input type=\"hidden\" name=\"domainid\" value=\"$domainid\">";
	$form .= "<input type=\"submit\" name=\"delete\" value=\"Delete Domain: $domainname\">";
	$form .= "</form>";

	$text  = "This action is not reversible. ";
	$text .= "All mailbox directories belonging to accounts within the $domainname domain ";
	$text .= "will be deleted from the system. All accounts, ";
	$text .= "mailboxes, and aliases under this domiain will be removed, and the domain ";
	$text .= "directory will be deleted.<hr>$form";

	$title = "Confirm deletion of Domain: $domainname";

	include "templates/confirm.template";
	exit ();
}

/************************************************************
	Draw a verification page to delete an account
*/
function verify_account_delete ($accountid, $accountname)
{
	$form  = "<form action=\"$_SERVER[PHP_SELF]\" method=\"post\">";
	$form .= "<input type=\"hidden\" name=\"accountid\" value=\"$accountid\">";
	$form .= "<input type=\"submit\" name=\"delete\" value=\"Delete Account: $accountname\">";
	$form .= "</form>";

	$text  = "This action is not reversible. ";
	$text .= "All mailbox directories belonging to $accountname will be deleted from the system. ";
	$text .= "All mailboxes and aliases under this account will be removed, and the account ";
	$text .= "will be removed.<hr>$form";

	$title = "Confirm deletion of Account: $accountname";

	include "templates/confirm.template";
	exit ();
}

/************************************************************
	Error handler for deleting directories.
*/
function delete_error ($error, $error_string, $filename, $line, $symbols)
{
	global $errors, $error_count;
	$errors .= "<br>$deldir: $error_string";
	$errorcount++;
}

/************************************************************
	Set up the query to delete mailbox directories
	for an entire domain.
*/
function delete_mailbox_in_domain ($domainid)
{
	global $table;
	
	// Delete all mailboxes in a domain
	$query = 
		"SELECT Home ".
		"FROM $table[mailboxes] ".
		"WHERE DomainId = '$domainid';";

	delete_mailbox_list ($query);
}

/************************************************************
	Set up the query to delete mailbox directories
	for an account.
*/
function delete_mailbox_in_account ($accountid)
{
	global $table;

	// Delete all mailboxes in a domain
	$query = 
		"SELECT Home ".
		"FROM $table[mailboxes] ".
		"WHERE AccountId = '$accountid';";

	delete_mailbox_list ($query);
}

/************************************************************
	Delete the mailbox directories that are in the query
	result list.
*/
function delete_mailbox_list ($query)
{
	$handle = do_query ($query);

	set_error_handler ('delete_error');
	while ( $row = mysql_fetch_row ($handle) )
		{
		$deldir = $row[0];
		if ($deldir == $virthome) { 
			error_page ("Directory cannot be virtual home:  $deldir");
		}
		if ( file_exists ($deldir) ) { @system ("rm -rf $deldir"); }
		}
	restore_error_handler ();
}

/************************************************************
	Delete the domain directory
*/
function delete_domain ($domaindir)
{
	set_error_handler ('delete_error');
	$deldir = $domaindir;
	if ($deldir == $virthome) { 
		error_page ("Directory cannot be virtual home:  $deldir");
	}
	if ( file_exists ($deldir) ) { @system ("rm -rf $deldir"); }
	restore_error_handler ();
}

/************************************************************
	Begin the page here
*/
manage_session ();

global $table;

if ( isset ($_POST['domainid']) )
	{
	// Delete an entire domain and all accounts and 
	// mailboxes in the account

	// Selet the domain to get the name and directory
	$domainid = $_POST['domainid'];
	$query = 
		"SELECT DomainName, Directory ".
		"FROM $table[domains] ".
		"WHERE DomainId = '$domainid';";

	$handle = do_query ($query);
	$row = mysql_fetch_row ($handle);
	$domainname = $row[0];
	$domaindir  = $row[1];

	if ( isset ($_POST['verify']) ) { verify_domain_delete($domainid, $domainname); }

	// Do the mailboxes first
	$errors = 
		"The following errors were encountered while " .
		"deleteing mailboxes from domain: $domainname";
	$error_count = 0;

	delete_mailbox_in_domain ($domainid);

	// Delete the domain directory
	delete_domain ($domaindir);

	// Now clean up the tables
	$query = "DELETE FROM $table[aliases] WHERE DomainId = '$domainid';";
	do_query ($query);

	$query = "DELETE FROM $table[forwards] WHERE DomainId = '$domainid';";
	do_query ($query);

	$query = "DELETE FROM $table[mailboxes] WHERE DomainId = '$domainid';";
	do_query ($query);

	$query = "DELETE FROM $table[accounts] WHERE DomainId = '$domainid';";
	do_query ($query);

	$query = "DELETE FROM $table[domains] WHERE DomainId = '$domainid';";
	do_query ($query);

	// Set the alias and domain update times
	$query = "UPDATE $table[update] SET AliasUpdateTime = NOW(), DomainUpdateTime = NOW();";
	do_query ($query);

	if ( $error_count )
		{
		error_page ($errors);
		}
	else
		{
		redirect ("domains.php");
		}
	}


elseif ( isset ($_POST['accountid']) )
	{
	// Delete an entire account and all its mailboxes

	// Selet the domain to get the name and directory
	$accountid = $_POST['accountid'];
	$query = 
		"SELECT AccountName ".
		"FROM $table[accounts] ".
		"WHERE AccountId = '$accountid';";

	$handle = do_query ($query);
	$row = mysql_fetch_row ($handle);
	$accountname = $row[0];

	$errors = 
		"The following errors were encountered while " .
		"deleteing mailboxes from account: $accountname";
	$error_count = 0;

	// Draw verify page if necessary
	if ( isset ($_POST['verify']) ) { verify_account_delete($accountid, $accountname); }

	// Delete the mailboxes
	delete_mailbox_in_account ($accountid);

	// Now clean up the tables
	$query = "DELETE FROM $table[aliases] WHERE AccountId = '$accountid';";
	do_query ($query);

	$query = "DELETE FROM $table[forwards] WHERE AccountId = '$accountid';";
	do_query ($query);

	$query = "DELETE FROM $table[mailboxes] WHERE AccountId = '$accountid';";
	do_query ($query);

	$query = "DELETE FROM $table[accounts] WHERE AccountId = '$accountid';";
	do_query ($query);

	$query = "DELETE FROM $table[access] Where DomainId = '$_POST[domainid]';";
	do_query ($query);

	// Set the alias update time
	$query = "UPDATE $table[update] SET AliasUpdateTime = NOW();";
	do_query ($query);


	if ( $error_count )
		{
		error_page ($errors);
		}
	else
		{
		redirect ("accounts.php");
		}
	}

else
	{
	error_page ("Invalid operation");
	}
?>
