<head>
    <meta name="viewport" content="width=device-width"/>
</head>

<?php

/************************************************************
	EDIT, ADD, DELETE A MAILBOX
*/
require_once ("session.php");

/************************************************************
	Set the form data to default values
*/
function clear_data ($account, $mode)
{
	global $form, $table;

	$form = array
		( "account" => $account, 
		  "action" => "create");
	$form['alias'] = array ();

	// Set the domain id and name by reading the account record
	$query =
		"SELECT D.DomainId, D.DomainName, D.Directory, " .
		"       A.MailboxLimit, D.AliasLimit, " .
		"		D.Uid, D.Gid, D.Quota, " .
		"		A.AccountName, A.ClearPass, A.FullName, D.PrimaryDomain " .
		"FROM $table[domains] AS D, $table[accounts] AS A " .
		"WHERE A.AccountId = '$account' " .
		"AND   A.DomainId = D.DomainId";
	$handle = do_query ($query);
	$row = mysql_fetch_row ($handle);
	$form['domain'] = $row[0];
	$form['domainname'] = $row[1];
	$form['domaindir'] = $row[2];
	$form['mlimit'] = $row[3];
	$form['alimit'] = $row[4];
	$form['uid'] = $row[5];
	$form['gid'] = $row[6];
	$form['quota'] = $row[7];
	$form['accountname'] = $row[8];
	$form['primarydomain'] = $row[11];

	if ( $mode == "default" )
		{
		$form['mailboxname'] = $row[8];
	        if ( strpos ($form['mailboxname'], "@") )
			{	
			$name = substr ($form['mailboxname'], 0, strpos ($form['mailboxname'], "@"));
			$form['mailboxname'] = $name;
			}

		$form['password'] = $row[9];
		$form['fullname'] = $row[10];
		}
	else
		{
		$form['mailboxname'] = "";
		$form['password'] = "";
		$form['fulname'] = "";
		}
}

/************************************************************
	Read the record from the database and set the form
	data from it
*/
function load_data ($id)
{
	global $table, $form;

	$query = 
		"SELECT A.AccountName, A.AccountId " .
		"FROM $table[accounts] AS A , $table[mailboxes] AS M " .
		"WHERE A.AccountId = M.AccountId " .
		"AND M.MailboxId = '$_GET[mbx]';";
	$query_handle = do_query ($query);
	$row = mysql_fetch_row($query_handle);
	$form['accountname'] = $row[0];
	$form['accountid']   = $row[1];

	$query =
		"SELECT M.MailboxId, M.AccountId, M.MailboxName, M.Home, " .
		"       M.DomainId, D.DomainName, M.AliasLimit, " .
		"       M.Uid, M.Gid, M.Quota, M.FullName, D.PrimaryDomain " . 
		"FROM $table[mailboxes] AS M, $table[domains] AS D " .
		"WHERE M.MailboxId = '$id' " .
		"AND   M.DomainId = D.DomainId;";
	$handle = do_query ($query);
	$row = mysql_fetch_row ($handle);
	if ( ! $row )
		{
		error_page ("Unable to load mailbox ($id)");
		}
	
	$form['mbxid']		 = $row[0];
	$form['account']	 = $row[1];
	$form['mailboxname'] = $row[2];
	$form['maildir']     = $row[3];
	$form['domain']		 = $row[4];
	$form['domainname']	 = $row[5];
	$form['alimit']		 = $row[6];
	$form['uid']         = $row[7];
	$form['gid']         = $row[8];
	$form['quota']       = $row[9];
	$form['fullname']	 = $row[10];
	$form['action']		 = "update";
	$form['newalias']	 = "";
	$form['primarydomain']	 = $row[11];

	// Load the aliases
	$query =
		"SELECT AliasId, Alias from $table[aliases] " .
		"WHERE MailboxId = $form[mbxid];";

	$handle = do_query ($query);

	$aliases = array ();
	while ( $row = mysql_fetch_row ($handle) )
		{
		$aliases[$row[0]] = $row[1];
		}

	$form['alias'] = $aliases;
}

/************************************************************
	Update the mailbox record
*/
function update_mailbox ()
{
	global $table, $user;

	// Only update the alias access time if we change
	// the aliases
	$update_time = 0;

	// Check the new alias name if it was given
	if ( $_POST['newalias'] != "" )
		{
		check_name ($_POST['newalias'], $_POST['domain'], $_POST['domainname']);
		}

	if ( $user['type'] == 'U' )
		{
		// User can only update password and full name
		if ( $_POST['password'] != "" )
			{
			$query = 
				"UPDATE $table[mailboxes] SET " .
				"ClearPass = '$_POST[password]', " .
				"CryptPass = NULL, " .
				"FullName = '$_POST[fullname]' " .
				"WHERE MailboxId = '$_POST[mbxid]';";
			}
		else
			{
			$query = 
				"UPDATE $table[mailboxes] SET " .
				"FullName = '$_POST[fullname]' " .
				"WHERE MailboxId = '$_POST[mbxid]';";
			}
		do_query ($query);
		}
	else
		{
		// Update the password and other detail fields
		$query = 
			"UPDATE $table[mailboxes] SET ";

		if ( $_POST['password'] != "" )
			{
			$query .=
				"ClearPass = '$_POST[password]', " .
				"CryptPass = NULL, ";
			}
		$query .=
			"AliasLimit = '$_POST[alimit]', " .
			"Uid = '$_POST[uid]', " .
			"Gid = '$_POST[gid]', " .
			"Quota = '$_POST[quota]', " .
			"FullName = '$_POST[fullname]' " .
			"WHERE MailboxId = '$_POST[mbxid]';";

		do_query ($query);
		}

	// Handle alias deletion
	if ( count ($_POST['delalias']) > 0 )
		{
		foreach ( $_POST['delalias'] as $a )
			{
			$query = 
				"DELETE FROM $table[aliases] " .
				"WHERE AliasId = '$a';";
			do_query ($query);

			$update_time = 1;
			}
		}

	// Handle adding a new alias
	if ( $_POST['newalias'] != "" )
		{
		$query =
			"INSERT INTO $table[aliases] " .
			"(MailboxId, AccountId, DomainId, Alias, EditBy, EditWhen) " .
			"VALUES " .
			"('$_POST[mbxid]', '$_POST[account]', '$_POST[domain]', " .
			" '$_POST[newalias]','user[id]', NOW());";
		do_query ($query);

		$update_time = 1;
		}

	// Report that aliases have been changed
	if ( $update_time )
		{
		$query = 
			"UPDATE $table[update] " .
			"SET AliasUpdateTime = NOW();";
		do_query ($query);
		}
}

/************************************************************
	Check if the mailbox or alias name is valid
*/
function check_name ($name, $domainid, $domainname)
{
	global $table;

	// Check characters
	if ( strspn ($name, "-_.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890") !=
	     strlen ($name) )
		{
		error_page ("\"$name\" is an invalid alias name. " .
				"Mailbox and Alias may only contain letters, numbers, dash, underline, or period. Be sure " .
				"to enter only the mailbox or alias name, not the domain name or @.");
		}

	// Check for matching alias
	$query =
		"SELECT Alias FROM $table[aliases] " .
		"WHERE DomainId = '$_POST[domain]' " .
		"AND Alias = '$name';";
	$handle = do_query ($query);
	if ( mysql_num_rows ($handle) != 0 )
		{
		error_page ("\"$name\" is already assigned as an alias in the $domainname domain");
		}

	// Check for matching mailbox name
	$query =
		"SELECT MailboxName FROM $table[mailboxes] " .
		"WHERE DomainId = '$_POST[domain]' " .
		"AND MailboxName = '$name';";
	$handle = do_query ($query);
	if ( mysql_num_rows ($handle) != 0 )
		{
		error_page ("\"$name\" is already assigned as mailbox in the $domainname domain");
		}
}

/************************************************************
	Simple error trap for system command.
*/
function catch_error ($error, $error_string, $filename, $line, $symbols)
{
	error_page ("Error in: $filename line $line<hr>$error_string");
}

/************************************************************
	Create a new mailbox record.
*/
function create_mailbox ()
{
	global $table, $user, $form, $mdm_cmd, $commongrp;

	// Check for null values
	if ( $_POST['mailboxname'] == "" ) { error_page ("Mailbox name can not be empty."); }
	if ( $_POST['password'] == "" )    { error_page ("Password can not be empty."); }

	// check the name
	check_name ($_POST['mailboxname'], $_POST['domain'], $_POST['domainname']);

	// Construct the directory and username
	$maildir  = $_POST['domaindir']   . "/" . $_POST['mailboxname'];
	if ($_POST['primarydomain'] == "true") {
		$username = $_POST['mailboxname'];
	}
	else {
		$username = $_POST['mailboxname'] . "@" . $_POST['domainname'];
	}

	// Add the mail directory
	if (!file_exists($maildir)) {
		set_error_handler ('catch_error');
		@mkdir ($maildir);
		@chmod ($maildir, 0775);
		@system ("$mdm_cmd $maildir/Maildir");
		@system ("chmod -R 0775 $maildir");
		@system ("chgrp -R $commongrp $maildir");
		restore_error_handler ();
	}

	// Add the record
	$query =
		"INSERT INTO $table[mailboxes] " .
		"(AccountId, DomainId, MailboxName," .
		" UserName, ClearPass, AliasLimit, Uid, Gid, Home, Quota, FullName, " .
		" EditBy, EditWhen) " .
		"VALUES " .
		"('$_POST[account]'," .
		" '$_POST[domain]'," . 
		" '$_POST[mailboxname]'," . 
		" '$username'," . 
		" '$_POST[password]'," . 
		" '$_POST[alimit]', ".
		" '$_POST[uid]'," . 
		" '$_POST[gid]'," . 
		" '$maildir'," . 
		" '$_POST[quota]'," . 
		" '$_POST[fullname]', " .
		" '$user[id]'," . 
		" NOW()" . 
		");";		

	do_query ($query);
}

/************************************************************
	Delete a mailbox
*/
function delete_mailbox ()
{
	global $table, $virthome;

	if ($_POST['maildir'] == $virthome) { error_page ("Incorrect directory path: $_POST[maildir]"); }

	// Delete and clean up the mailbox directory
	if ( file_exists ($_POST['maildir']) )
		{
		set_error_handler ('catch_error');
		@system ("rm -rf $_POST[maildir]");
		restore_error_handler ();
		}

	// First delete all aliases
	$query =
		"DELETE FROM $table[aliases] " .
		"WHERE MailboxId = '$_POST[mbxid]';";
	do_query ($query);

	// If any aliases were deleted, update the time
	if ( mysql_affected_rows () != 0 )
		{
		$query = 
			"UPDATE $table[update] " .
			"SET AliasUpdateTime = NOW();";
		do_query ($query);
		}

	// Now delete the mailbox record
	$query =
		"DELETE FROM $table[mailboxes] " .
		"WHERE MailboxId = '$_POST[mbxid]';";
	do_query ($query);
}

/************************************************************
	Draw the edit form using the $form array.
*/
function mailbox_edit_form ()
{
	global $user, $form, $domains;

	echo "<form action=\"$_SERVER[PHP_SELF]\" method=\"post\">";

	// Hidden form values
	if ( $form['action'] == "create" )
		{
		if ( $user['type'] == 'U')
			{
			$hidden = array ("action", "account", "domain", "domainname", "domaindir", "alimit", "uid", "gid", "quota", "primarydomain");
			}
		else
			{
			$hidden = array 
				("action", "account", "domain", "domainname", "domaindir", "primarydomain");
			}
		}
	else
		{
		$hidden = array
			("action", "mbxid", "account", "domain", "domainname", "primarydomain");
		}
	foreach ($hidden as $h) 
		{ 
		echo "\n<input type=\"hidden\" name=\"$h\" value=\"$form[$h]\">";
		}

	echo "<table>";

	if ( $form['action'] == "update" )
		{
		echo "<tr><th>" . help ("Mailbox","em_name") . "</th><td>$form[mailboxname]@$form[domainname]</td></tr>";
		echo "<tr><th>" . help ("Change Mail Password","em_pwd") . "</th>";
		echo "<td><input type=\"password\" size=\"20\" name=\"password\">";
		echo "</td></tr>";
		}
	else
		{
		echo "<tr><th>" . help ("Mailbox Name","cm_name") . "</th><td>";
		echo "<input type=\"text\" size=\"15\" name=\"mailboxname\" value=\"$form[mailboxname]\">";
		echo "@$form[domainname]</td></tr>";

		echo "<tr><th>" . help ("Password","cm_pwd") . "</th>";
		echo "<td><input type=\"password\" size=\"20\" name=\"password\" value=\"$form[password]\">";
		echo "</td></tr>";
		}

	echo "<tr><th>" . help ("Full name","em_fullnm") . "</th><td>";
	echo "<input type=\"text\" size=\"30\" name=\"fullname\" value=\"$form[fullname]\">";
	echo "</td></tr>";

	if ( $user['type'] != 'U' )
		{
		echo "<tr><th>" . help ("Alias Limit","em_alimit") . "</th><td>";
		echo "<input type=\"text\" size=\"5\" name=\"alimit\" value=\"$form[alimit]\">";
		echo "</td></tr>";

		echo "<tr><th>" . help ("User Id","em_uid") . "</th><td>";
		echo "<input type=\"text\" size=\"5\" name=\"uid\" value=\"$form[uid]\">";
		echo "</td></tr>";

		echo "<tr><th>" . help ("Group Id","em_gid") . "</th><td>";
		echo "<input type=\"text\" size=\"5\" name=\"gid\" value=\"$form[gid]\">";
		echo "</td></tr>";

		echo "<tr><th>" . help ("Quota [MB]", "em_quota") . "</th><td>";
		echo "<input type=\"text\" size=\"5\" name=\"quota\" value=\"$form[quota]\">";
		echo "</td></tr>";
		}

	// Make a list to delete aliases
	if ( count ($form['alias']) > 0 )
		{
		echo "<tr><th>" . help ("Delete Aliases", "em_alias") . "</th><td>Select To Delete Alias";
		echo "<table>";
		foreach ( $form['alias'] as $k => $v )	
			{
			echo "<tr><td><input type=\"checkbox\" name=\"delalias[]\" value=\"$k\">" .
				 "</td><td>$v@$form[domainname]</td></tr>";
			}
		echo "</table></td></tr>";
		}

	// Add a new alias
	if ( $form['action'] == "update" && 
			($user['type'] != 'U' || count ($form['alias']) < $form['alimit']) )
		{
		echo "<tr><th>" . help ("Create New Alias","em_newalias") . "</th><td>".
			 "<input type=\"text\" size=\"15\" name=\"newalias\">@$form[domainname]</td></tr>";
		}

	// Submit
	echo "<tr><td colspan=\"2\">";
	if ( $form['action'] == "update" )
		{
		echo "<input type=\"submit\" name=\"submit\" value=\"Update\">";
		}
	else
		{
		echo "<input type=\"submit\" name=\"submit\" value=\"Add Mailbox\">";
		}
	echo "</td></tr>";

	echo "</form>";
	echo "</table>";

	// Delete form
	if ( $form['action'] == "update" )
		{
		echo "<form action=\"$_SERVER[PHP_SELF]\" method=\"post\">";
		echo "<input type=\"hidden\" name=\"action\" value=\"delete\">";
		echo "<input type=\"hidden\" name=\"mbxid\" value=\"$form[mbxid]\">";
		echo "<input type=\"hidden\" name=\"account\" value=\"$form[account]\">";
		echo "<input type=\"hidden\" name=\"maildir\" value=\"$form[maildir]\">";
		echo "<input type=\"submit\" name=\"submit\" value=\"Delete This Mailbox\">";
		echo "</form>";
		}

}

/************************************************************
	Begin page
*/
manage_session ();

// Get the data for the domain
if ( $_GET['mbx'] == "new" || $_GET['mbx'] == "default" )
	{
	clear_data ($_GET['account'], $_GET['mbx']);
	$accountname = $form['accountname'];
	$accountid   = $_GET['account'];
	$action = "create";

	// Make sure it's okay for the user to add another mailbox
	if ( $user['type'] == 'U' )
		{
		$query =
			"SELECT MailboxName FROM $table[mailboxes] " .
			"WHERE AccountId = '$accountid';";

		$handle = do_query ($query);
		if ( mysql_num_rows ($handle) >= $form['mlimit'] )
			{
			error_page ("Can't add another mailbox. Limit is $form[mlimit].");
			}
		}

	include ("templates/editmbx.template");
	}
elseif ( isset ($_GET['mbx']) )
	{
	load_data ( $_GET['mbx'] );
	$accountname = $form['accountname'];
	$accountid   = $form['accountid'];
	$action = "edit";
	include ("templates/editmbx.template");
	}
elseif ( $_POST['action'] == "update" )
	{
	update_mailbox ();
	redirect ("mailboxes.php?accountid=$_POST[account]");
	}
elseif ( $_POST['action'] == "create" )
	{
	create_mailbox ();
	redirect ("mailboxes.php?accountid=$_POST[account]");
	}
elseif ( $_POST['action'] == "delete" )
	{
	delete_mailbox ();
	redirect ("mailboxes.php?accountid=$_POST[account]");
	}
else
	{
	error_page ("Invalid operation");
	}

?>
