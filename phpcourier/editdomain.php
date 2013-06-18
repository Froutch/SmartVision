<head>
    <meta name="viewport" content="width=device-width"/>
</head>

<?php

/************************************************************
	EDIT, ADD, DELETE A DOMAIN
*/
require_once ("session.php");

/************************************************************
	Set the form data to default values
*/
function clear_data ()
{
	global $form, $virthome;

	$form = array (
		"uid" => "60",
		"gid" => "60",
		"mlimit" => "1",
		"alimit" => "5",
		"home" => "$virthome/",
		"action" => "create"
		); 
}

/************************************************************
	Read the record from the database and set the
	form data from it.
*/
function load_data ($id)
{
	global $table, $form;

	$query = 
		"SELECT DomainId, DomainName, Uid, Gid, Directory, Quota, " .
		"       MailboxLimit, AliasLimit, PrimaryDomain " .
		"FROM $table[domains] " .
		"WHERE DomainId = '$id';";
	$handle = do_query ($query);

	$row = mysql_fetch_row ($handle);
	if ( ! $row )
		{
		error_page ("Unable to load domain $id.");
		}

	$form['domainid']	= $row[0];
	$form['domainname']	= $row[1];
	$form['uid']		= $row[2];
	$form['gid']		= $row[3];
	$form['home']		= $row[4];
	$form['quota']		= $row[5];
	$form['mlimit']		= $row[6];
	$form['alimit']		= $row[7];
	$form['action']		= "update";
	$form['status']		= "$row[8]";
}

/************************************************************
	Update the domain record.
*/
function update_domain () {
	global $table;
	
	$query = 
		"UPDATE $table[domains] " .
		"SET " . 
		"Uid = '$_POST[uid]', " .
		"Gid = '$_POST[gid]', " .
		"Quota = '$_POST[quota]', " .
		"MailboxLimit = '$_POST[mlimit]', " .
		"AliasLimit = '$_POST[alimit]' " .
		"WHERE DomainId = '$_POST[domainid]';";

	do_query ($query);
}

/************************************************************
	Simple error trap for system command.
*/
function catch_error ($error, $error_string, $filename, $line, $symbols)
{
	error_page ("Error in: $filename line $line<hr>$error_string");
}

/************************************************************
	Create a new domain record.
*/
function create_domain ()
{
	global $table, $commongrp, $allowspecifyvirthome, $virthome;

	// Set default Home
	if ($allowspecifyvirthome != "true"){
		$_POST[home] = "$virthome/$_POST[domainname]";
	}
	if ( $_POST[home] == $virthome ) {
            error_page ("Invalid domain directory.  Domain directory cannot be the root domain.");
        }

	
	// Check that the name is valid
	check_name ($_POST['domainname'], $_POST['home']);

	// Create a new directory. If chown is preferable over chmod,
	// add a new variable to globals.inc and reference it here.
	if (!file_exists($_POST['home'])) {
		set_error_handler ('catch_error');
		@mkdir ($_POST['home'], 0775);
		@chgrp ($_POST['home'], $commongrp);
		@chmod ($_POST['home'], 0775);
		restore_error_handler ();
	}
	
	if ($_POST['status'] == 'on') { $domainstatus = 'true'; }
	else { $domainstatus = 'false'; }

	// Add the domain
	$query = 
		"INSERT INTO $table[domains] " .
		"(DomainName,Uid,Gid,Directory,Quota,MailboxLimit,AliasLimit,EditBy, EditWhen, PrimaryDomain) VALUES " .
		"('$_POST[domainname]'," . 
		"'$_POST[uid]'," .
		"'$_POST[gid]'," .
		"'$_POST[home]'," .
		"'$_POST[quota]'," .
		"'$_POST[mlimit]'," .
		"'$_POST[alimit]'," .
		"'$user[id]', NOW()," . 
		"'$domainstatus');";

	do_query ($query);

	// Get the domain id
	$query = "SELECT LAST_INSERT_ID();";
	$handle = do_query ($query);
	$row = mysql_fetch_row ($handle);
	
	// Pretend that it was in the form data
	$_POST['domainid'] = $row[0];

	$query = "UPDATE $table[update] SET DomainUpdateTime = NOW()";
	do_query ($query);
}

/************************************************************
	Check if the domain name and home directory values are ok
*/
function check_name ($domain, $home)
{
	global $table;

	// Can't be empty
	if ( $domain == "" )
		{
		error_page ("Domain name can not be empty");
		}

	if ( $home == "" )
		{
		error_page ("Pathname for new domain can not be empty");
		}

	// Check for valid characters
	if ( strspn ($domain, "-_.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890") !=
	     strlen ($domain) )
		{
		error_page ("\"$name\" is an invalid alias name. " .
				"Domain names may only contain letters, numbers, dash, underline, or period.");
		}

	if ( strspn ($home, "-/_.abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ01234567890") !=
	     strlen ($home) )
		{
		error_page ("\"$home\" is an invalid directory name. " .
				"Domain names may only contain letters, numbers, dash, slash, underline, or period.");
		}

	// Check for matching domain name or home
	$query =
		"SELECT DomainName from $table[domains] " .
		"WHERE DomainName = '$domain';";
	$handle = do_query ($query);
	if ( mysql_num_rows ($handle) != 0 )
		{
		error_page ("\"$domain\" already exists.");
		}
	
	$query =
		"SELECT DomainName from $table[domains] " .
		"WHERE Directory = '$home';";
	$handle = do_query ($query);
	if ( mysql_num_rows ($handle) != 0 )
		{
		$row = mysql_fetch_row ($handle);
		error_page ("\"$home\" is already used as the directory for domain: $row[0].");
		}
}

/************************************************************
	Delete a domain record
*/
function delete_domain ()
{
	global $table;

	// Don't delete if there are any accounts in the domain
	$query =
		"SELECT AccountName FROM $table[accounts] " .
		"WHERE DomainId = '$_POST[domainid]' " .
		"AND   AccountType = 'U';";
	$handle = do_query ($query);

	if ( mysql_num_rows ($handle) != 0 )
		{
		$msg = "Unable to delete domain. The following user accounts " .
		       "are attached to the domain.<ul>";
		while ( $row = mysql_fetch_row ($handle) )
			{
			$msg .= "<li>$row[0]</li>";
			}
		$msg .= "</ul>";

		$form  = "<form action=\"delete.php\" method=\"post\">";
		$form .= "<input type=\"hidden\" name=\"domainid\" value=\"$_POST[domainid]\">";
		$form .= "<input type=\"hidden\" name=\"verify\" value=\"1\">";
		$form .= "<input type=\"submit\" name=\"delete\" ".
		 		"value=\"Delete This Domain and all accounts and mailboxes in the domain\">";
		$form .= "</form>";

		$msg .= "<hr>$form";

		error_page ($msg);
		}
	else
		{
		# Next check the domain access list for administrators
		$query =
			"SELECT A.AccountName " .
			"FROM $table[accounts] as A, $table[access] as B " .
			"WHERE A.AccountId = B.AccountId " .
			"AND A.AccountType = 'A' " .
			"AND B.DomainId = '$_POST[domainid]';";
		$handle = do_query ($query);

		if ( mysql_num_rows ($handle) != 0 )
			{
			$msg = "Unable to delete domain. The following administrator " .
					"accounts are attached to the domain.<ul>";
			while ( $row = mysql_fetch_row ($handle) )
				{
				$msg .= "<li>$row[0]</li>";
				}
			$msg .= "</ul>";
			error_page ($msg);
			}
		else
			{
			// Okay to delete 

			// Delete the directory
			if ( file_exists ($_POST['home']) )
				{
				set_error_handler ('catch_error');
				@rmdir ($_POST['home']);
				restore_error_handler ();
				}

			// Delete the row
			$query = 
				"DELETE FROM $table[domains] " .
				"WHERE DomainId = '$_POST[domainid]';";
			do_query ($query);
			
			// Delete records from the Domain Access table
			$query =
				"DELETE FROM $table[access] " .
				"Where DomainId = '$_POST[domainid]';";
			do_query ($query);

			$query = "UPDATE $table[update] SET DomainUpdateTime = Now()";
			do_query ($query);
			}
	}
}

/************************************************************
	Draw the edit form using the $form array.
*/
function domain_edit_form ()
{
	global $form, $allowspecifyvirthome;

	echo "<form action=\"$_SERVER[PHP_SELF]\" method=\"post\">";
	echo "<input type=\"hidden\" name=\"action\" value=\"$form[action]\">";
	echo "<input type=\"hidden\" name=\"domainid\" value=\"$form[domainid]\">";

	echo "<table>";

	if ( $form['action'] == "create" ) {
		echo "<tr><th>" . help ("Domain Name", "cd_name") . " </th><td>";
		echo "<input type=\"text\" size=\"30\" name=\"domainname\" value=\"$form[domainname]\">";
		echo "</td></tr>";

		if ($allowspecifyvirthome == "true") {
			echo "<tr><th>" . help ("Home Directory", "cd_home") . "</th><td>";
			echo "<input type=\"text\" size=\"50\" name=\"home\" value=\"$form[home]\">";
			echo "</td></tr>";
		}

		echo "<tr><th>" . help ("Domain Status", "cd_status") . " </th><td>";
		echo "<input type=\"checkbox\" name=\"status\"> Local Domain";
		echo "</td></tr>";
	}
	else {
		if ($form[status] == 'true') {
		echo "<tr><th>" . help ("Domain Status", "cd_status") . " </th><td>";
		echo "<span style=\"color:blue;font-weight:bold;\">Defined as Local Domain</span>";
		echo "</td></tr>";
		}
	}

	echo "<tr><th>" . help ("Default Account Setup","ed_setup") . "</th><td>";
	echo "<table>";
	echo "<tr><th>" . help ("User Id","ed_uid") . "</th><td><input type=\"text\" size=\"5\" ".
		 "name=\"uid\" value=\"$form[uid]\"></td></tr>";

	echo "<tr><th>" . help ("Group Id","ed_gid") . "</th><td><input type=\"text\" size=\"5\" ".
		 "name=\"gid\" value=\"$form[gid]\"></td></tr>";

	echo "<tr><th>" . help ("Quota [MB]","ed_quota") . "</th><td><input type=\"text\" size=\"5\" ".
		   "name=\"quota\" value=\"$form[quota]\"></td></tr>";

	echo "<tr><th>" . help ("Mailbox Per Account", "ed_mlimit") . "</th><td><input type=\"text\" size=\"5\" " . 
		   "name=\"mlimit\" value=\"$form[mlimit]\"></td></tr>";

	echo "<tr><th>" . help ("Alias Per Mailbox" , "ed_alimit") . "</th><td><input type=\"text\" size=\"5\" " . 
		   "name=\"alimit\" value=\"$form[alimit]\">";

	echo "</table>";
	echo "</td></tr>";

	echo "<tr><td colspan=\"2\">";
	if ( $form['action'] == "update" )
		{
		echo "<input type=\"submit\" name=\"submit\" value=\"Update\">";
		}
	else
		{
		echo "<input type=\"submit\" name=\"submit\" value=\"Add Domain\">";
		}
	echo "</td></tr>";

	echo "</table>";
	echo "</form>";

	if ( $form['action'] != "create") 
		{
		echo "<form action=\"$_SERVER[PHP_SELF]\" method=\"post\">";
		echo "<input type=\"hidden\" name=\"action\" value=\"delete\">";
		echo "<input type=\"hidden\" name=\"domainid\" value=\"$form[domainid]\">";
		echo "<input type=\"hidden\" name=\"home\" value=\"$form[home]\">";
		echo "<input type=\"submit\" name=\"submit\" value=\"Delete This Domain\">";
		echo "</form>";
		}

}

/************************************************************
	Begin page
*/
manage_session ();

if ( $user['type'] != 'M' )
	{
	error_page ("User not authorized for this page.");
	}

// Get the data for the domain
if ( $_GET['domain'] == "new" )
	{
	clear_data ();
	$action = "create";
	include ("templates/editdomain.template");
	}
elseif ( isset ($_GET['domain']) )
	{
	load_data ( $_GET['domain'] );
	$action = "edit";
	include ("templates/editdomain.template");
	}
elseif ( $_POST['action'] == "update" )
	{
	update_domain ();
	redirect ("domains.php");
	}
elseif ( $_POST['action'] == "create" )
	{
	create_domain ();
	redirect ("domains.php");
	}
elseif ( $_POST['action'] == "delete" )
	{
	delete_domain ();
	redirect ("domains.php");
	}
else
	{
	error_page ("Invalid operation");
	}

?>
