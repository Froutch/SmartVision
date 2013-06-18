<head>
    <meta name="viewport" content="width=device-width"/>
</head>

<?php

/************************************************************
	EDIT OR DELETE AN ACCOUNT
*/
require_once ("session.php");

/************************************************************
	Load the list of domains this user can see.
*/
function load_domain_list ($type, $id)
{
	global $user, $table;
	$domainlist = array ();
	
	// Select all the domains that exist
	if ( $type == 'M' )
		{
		$query = "SELECT DomainId, DomainName FROM $table[domains] ORDER BY DomainName";
		}

	// Select only the domains visiable to this admin
	elseif ( $type == 'A' )
		{
		$query =
			"SELECT D.DomainId, D.DomainName " .
			"FROM $table[domains] as D, $table[access] as A " .
			"WHERE D.DomainId = A.DomainId " .
			"AND A.AccountId = '$id' ORDER BY D.DomainName;";
		}

	// Select the name and id for the domain in the account reacord
	else
		{
		$query = 
			"SELECT D.DomainId, D.DomainName " .
			"FROM $table[domains] as D, $table[accounts] as Acct " .
			"WHERE D.DomainId = Acct.DomainId " .
			"AND Acct.AccountId = '$id' ORDER BY D.DomainName;";
		}

	// Now do the query and get the list
	$handle = do_query ($query);
	while ( $row = mysql_fetch_row ($handle) )
		{
		$domainlist[$row[0]] = $row[1];
		}
	return $domainlist;
}

/************************************************************
	Load the data from the database and set the form data.
*/
function load_data ($id)
{
	global $table, $form;

	$query =
		"SELECT AccountId, AccountName, AccountType, FullName, Active, " .
		"		AdminNotes, UserNotes, DomainId, MailboxLimit, CompanyName, PhoneNumber " .
		"FROM $table[accounts] " .
		"WHERE AccountId = '$id';";

	$handle = do_query ($query);

	$row = mysql_fetch_row ($handle);
	if ( ! $row )
		{
		error_page ("Unable to load account $id");
		}

	$form['accountid']		= $row[0];
	$form['accountname']	= $row[1];
	$form['accounttype']	= $row[2];
	$form['accountfn']		= $row[3];
	$form['accountactive']	= $row[4];
	$form['accountanotes']	= $row[5];
	$form['accountunotes']	= $row[6];
	$form['accountdomain']	= $row[7];
	$form['accountmlimit']  = $row[8];
	$form['accountcomp']    = $row[9];
	$form['accountphone']   = $row[10];
	$form['newforward']     = "";

	// Load any forwards for this account
	$query =
		"SELECT ForwardId, FromAddress, ToAddress " .
		"FROM $table[forwards] " .
		"WHERE AccountId = '$form[accountid]';";
	$handle = do_query ($query);
	$from = array ();
	$to = array ();
	while ( $row = mysql_fetch_row ($handle) )
		{
		$from[$row[0]] = $row[1];
		$to[$row[0]]   = $row[2];
		}

	$form['forwardfrom'] = $from;
	$form['forwardto']   = $to;
}

/************************************************************
	Update the account record.
*/
function update_account ()
{
	global $table, $user;

	// Only update the alias access time if we
	// add or remove a forwarding address
	$update_time = 0;

	// If password is blank, don't update it
	if ( $_POST['accountpwd'] != "" )
		{
		$query = 
			"UPDATE $table[accounts] SET " .
			"OldPass = ClearPass, " .
			"CryptPass = PASSWORD ('$_POST[accountpwd]'), " .
			"ClearPass = '$_POST[accountpwd]', ";
		}
	else
		{
		$query = "UPDATE $table[accounts] SET ";
		}

	$query .= 
		"FullName = '$_POST[accountfn]', ";

	$update_status = false;
	if ( isset ($_POST['accountactive']) )
		{
		if ( $_POST['accountactive'] != $_POST['saveactive'] )
			{
			$query .= "Active = '$_POST[accountactive]', ";
			$update_status = true;
			}
		}

	if ( isset ($_POST['accountanotes']) )
		{
		$query .= "AdminNotes = '$_POST[accountanotes]', ";
		}

	if ( isset ($_POST['accountunotes']) )
		{
		$query .= "UserNotes = '$_POST[accountunotes]', ";
		}
	
		$query .= "MailboxLimit = '$_POST[accountmlimit]', ";

	$query .=
		"CompanyName = '$_POST[accountcomp]', " .
		"PhoneNumber = '$_POST[accountphone]', " .
		"EditBy = '$user[id]', " .
		"EditWhen = NOW() " .
		"WHERE AccountId = '$_POST[accountid]';";
	//error_page ($query);
	do_query ($query);

	// If an administrator is being updated, reset the
	// domain access
	if ( $_POST['accounttype'] == 'A' )
		{
		// First delete all domain access records
		$query = 
			"DELETE FROM $table[access] " .
			"WHERE AccountId = '$_POST[accountid]';";
		do_query ($query);

		// Now add the new records
		$query =
			"INSERT INTO $table[access] (AccountId, DomainId) " .
			"VALUES ";
		$comma = "";
		foreach ($_POST['access'] as $d)
			{
			$query .= $comma . "($_POST[accountid],$d)";
			$comma = ", ";
			}
		$query .= ";";

		do_query ($query);
		}

	if ( $update_status )
		{
		// Disable or enable mailbox logins
		if ( $_POST['accountactive'] == "false" )
			{
			// Get a random pwd value
			$seed = time () . "-" . rand ();
			$pwd = md5 ($seed);
			$query =
				"UPDATE $table[mailboxes] " .
				"SET OldPass = ClearPass, " .
				"CryptPass = NULL, " .
				"ClearPass = '$pwd' " .
				"WHERE AccountId = '$_POST[accountid]';";
			}
		else
			{
			// Reset the password
			$query =
				"UPDATE $table[mailboxes] " .
				"SET ClearPass = OldPass, " .
				"CryptPass = NULL, " .
				"OldPass = NULL " .
				"WHERE AccountId = '$_POST[accountid]';";
			}
		do_query ($query);
		}

	// Handle deletion of forwarding addresses
	if ( count ($_POST['delfwd']) > 0 )
		{
		foreach ( $_POST['delfwd'] as $fid )
			{
			$query = 
				"DELETE FROM $table[forwards] " .
				"WHERE ForwardId = '$fid';";
			do_query ($query);

			$update_time = 1;
			}
		}

	// Add new forwards for this account
	if ( isset ($_POST['newfwdfrom']) &&
         $_POST['newfwdfrom'] != "" &&
		 $_POST['newfwdto'] != "" )
		{
		$query =
			"INSERT INTO $table[forwards] ".
			"(AccountId, DomainId, FromAddress, ToAddress,".
		    " EditBy, EditWhen) " .
			"VALUES " .
			"('$_POST[accountid]', '$_POST[accountdomain]', " .
			" '$_POST[newfwdfrom]', '$_POST[newfwdto]', " .
			" '$user[id]', NOW());";
		do_query ($query);

		$update_time = 1;
		}

	// Trigger regeneration of alias file
	if ( $update_time )
		{
		$query = 
			"UPDATE $table[update] " .
			"SET AliasUpdateTime = NOW();";
		do_query ($query);
		}
}

/************************************************************
	Create a new account record.
*/
function create_account ()
{
	global $table, $user, $form;

	// Make sure the name and password are not null
	if ( $_POST['accountname'] == "" )
		{
		error_page ("Account name may not be empty");
		}
	if ( $_POST['accountpwd'] == "" )
		{
		error_page ("Password may not be empty");
		}

	// First see if there is already an account with this name
	$query = 
		"SELECT AccountName FROM $table[accounts] " .
		"WHERE AccountName = '$_POST[accountname]';";
	$handle = do_query ($query);
	if ( mysql_num_rows ($handle) != 0 )
		{
		error_page ("The account name \"$_POST[accountname]\" already exists. ");
		}

	// Set the domain to zero for administrators
	if ( $_POST['accounttype'] == 'A' ) { $d = 0; }
	else                                { $d = $_POST['domainid']; }

	$query = 
		"INSERT INTO $table[accounts] " .
		"(DomainId, AccountName, CryptPass, ClearPass, FullName, " .
		" MailboxLimit, AccountType, Active, CompanyName, PhoneNumber, EditBy, EditWhen) " .
		"VALUES " .
		"('$d', '$_POST[accountname]', " .
		" PASSWORD ('$_POST[accountpwd]'), '$_POST[accountpwd]', " .
		" '$_POST[accountfn]', " .
		" '$_POST[accountmlimit]', '$_POST[accounttype]', 'true', " .
		" '$_POST[accountcomp]', '$_POST[accountphone]', '$user[id]', NOW());";

	do_query ($query);

	// Find out what id was just created
	$query = "SELECT LAST_INSERT_ID();";
	$handle = do_query ($query);
	$row = mysql_fetch_row ($handle);
	
	// Pretend that it was in the form data
	$_POST['accountid'] = $row[0];

	// If this is an administrator, set the domain access record
	if ( $_POST['accounttype'] == 'A' )
		{
		$query = 
			"INSERT INTO $table[access] (AccountId,DomainId) " .
			"VALUES ('$_POST[accountid]','$_POST[domainid]');";
		do_query ($query);
		}

	// Now make the default mailbox record

	// Update the mail table

	// Create the mail directory
}

/************************************************************
	Delete an account.
*/
function delete_account ()
{
	global $table;

	// Don't delete if there are mailboxes for this account
	$query =
		"SELECT UserName FROM $table[mailboxes] " .
		"WHERE AccountId = '$_POST[accountid]';";

	$handle = do_query ($query);

	if ( mysql_num_rows ($handle) != 0 )
		{
		$msg = "Unable to delete account. The following mailboxes " .
			   "belong to the account.<ul>";
		while ( $row = mysql_fetch_row ($handle) )
			{
			$msg .= "<li>$row[0]</li>";
			}
		$msg .= "</ul>";

		$form  = "<form action=\"delete.php\" method=\"post\">";
		$form .= "<input type=\"hidden\" name=\"accountid\" value=\"$_POST[accountid]\">";
		$form .= "<input type=\"hidden\" name=\"verify\" value=\"1\">";
		$form .= "<input type=\"submit\" name=\"delete\" value=\"Delete This Account and all mailboxes in the account\">";
		$form .= "</form>";

		$msg .= "<hr>$form";

		error_page ($msg);
		}
	else
		{
		// Okay to delete
		$query = 
			"DELETE FROM $table[accounts] " .
			"WHERE AccountId = '$_POST[accountid]';";
		do_query ($query);
		}

	// Change any EditBy fields from the deleted account
	// to the master account. Assume that the master account
	// has accounttype = 1. (If that's not always true,
	// do a slect on AccountType = 'M' to find one).
	$query =
		"UPDATE $table[accounts] " .
		"SET EditBy = '1' " .
		"WHERE EditBy = '$_POST[accountid]';";
	do_query ($query);

	// Delete any forwards attached to this account
	$query =
		"DELETE FROM $table[forwards] " .
		"WHERE AccountId = '$_Post[accountid]';";
	do_query ($query);

	// If any forwards were deleted, update the time
	if ( mysql_affected_rows () != 0 )
		{
		$query = 
			"UPDATE $table[update] " .
			"SET AliasUpdateTime = NOW();";
		do_query ($query);
		}
}

/************************************************************
	Draw the form for account creation or editing.
	There are a lot of different type of forms depending
	on who is doing the 
*/
function account_edit_form ()
{
	global $form;

	if ( $form['action'] == "create" ) { create_form (); }
	else                               { edit_form (); }
}

/************************************************************
	Draw the form to create a new account
*/
function create_form ()
{
	global $user, $form, $table, $domainid;

	echo "<form action=\"$_SERVER[PHP_SELF]\" method=\"post\">";
	echo "<input type=\"hidden\" name=\"action\" value=\"create\">";
	echo "<input type=\"hidden\" name=\"domainid\" value=\"$form[domainid]\">";

	echo "<table>";

	// Basic account information
	echo "<tr><th>" . help ("Account Name", "ca_name"). "</th><td>";
	echo "<input type=\"text\" size=\"40\" name=\"accountname\">";
	echo "</td></tr>";

	echo "<tr><th>" . help("Password", "ea_pwd") . "</th><td>";
	echo "<input type=\"password\" size=\"40\" name=\"accountpwd\">";
	echo "</td></tr>";

	echo "<tr><th>" . help ("Company Name","ea_comp"). "</th><td>";
	echo "<input type=\"text\" size=\"40\" name=\"accountcomp\" value=\"$form[accountcomp]\">";
	echo "</td></tr>";

	echo "<tr><th>" . help ("Phone Number","ea_phone") . "</th><td>";
	echo "<input type=\"text\" size=\"40\" name=\"accountphone\" value=\"$form[accountphone]\">";
	echo "</td></tr>";

	echo "<tr><th>" . help("Full Name","ea_fullnm"). "</th><td>";
	echo "<input type=\"text\" size=\"40\" name=\"accountfn\">";
	echo "</td></tr>";

	if ( $user['type'] == 'M' )
		{
		// Add the selector for account type
		echo "<tr><th>" . help ("Account Type", "ca_accty") . "</th><td>";
		echo "<select name=\"accounttype\">";
		$opts = array ("U" => "User", "A" => "Administrator");
		foreach ($opts as $k=>$v)
			{ echo "<option value=\"$k\">$v</option>"; }
		echo "</select>";
		echo "</td></tr>";
		}
	else
		{
		// Force account type to be user
		echo "<input type=\"hidden\" name=\"accounttype\" value=\"U\">";
		}

	$query = "SELECT MailboxLimit from $table[domains] where DomainId = '$domainid';";
	$handle = do_query ($query);
	$row = mysql_fetch_row ($handle);
	$val = $row[0];
	echo "<tr><th>" . help ("Mailbox Limit", "ea_mlimit") . "</th><td><input type=\"text\" size=\"5\" ".
		"name=\"accountmlimit\" value=\"$val\"></td></tr>";

	echo "<tr><td colspan=\"2\">";
	echo "<input type=\"submit\" name=\"submit\" value=\"Create Account\">";
	echo "</td></tr>";
	

	echo "</table>";
	echo "</form>";
}

/************************************************************
	Draw the form to edit an existing account.
*/
function edit_form ()
{
	global $user, $form, $domains;

	echo "<form action=\"$_SERVER[PHP_SELF]\" method=\"post\">";
	echo "<input type=\"hidden\" name=\"action\" value=\"update\">";
	echo "<input type=\"hidden\" name=\"accountid\" value=\"$form[accountid]\">";
	echo "<input type=\"hidden\" name=\"accounttype\" value=\"$form[accounttype]\">";
	echo "<input type=\"hidden\" name=\"accountdomain\" value=\"$form[accountdomain]\">";

	echo "<table>";

	echo "<tr><th>" . help ("Account Name","ea_name") . "</th><td>$form[accountname]</td></tr>";

	if ( $user['type'] == 'M' )
		{
		echo "<tr><th>" . help ("Account Type", "ea_accty") . "</th><td>";
		echo $form['accounttype'] == 'U' ? "User" : "Administrator";
		echo "</td></tr>";
		}

	echo "<tr><th>" . help ("Change Web<br>Login Password", "ea_pwd") . "</th><td>";
	echo "<input type=\"password\" size=\"40\" name=\"accountpwd\">";
	echo "</td></tr>";

	echo "<tr><th>" . help ("Company Name", "ea_comp") . "</th><td>";
	echo "<input type=\"text\" size=\"40\" name=\"accountcomp\" value=\"$form[accountcomp]\">";
	echo "</td></tr>";

	echo "<tr><th>" . help ("Phone Number", "ea_phone") . "</th><td>";
	echo "<input type=\"text\" size=\"40\" name=\"accountphone\" value=\"$form[accountphone]\">";
	echo "</td></tr>";

	echo "<tr><th>" . help ("Full Name","ea_fullnm") . " </th><td>";
	echo "<input type=\"text\" size=\"40\" name=\"accountfn\" value=\"$form[accountfn]\">";
	echo "</td></tr>";

	if ( $user['type'] != 'U' )
		{
		echo "<input type=\"hidden\" name=\"saveactive\" value=\"$form[accountactive]\">";
		echo "<tr><th>" . help ("Status", "ea_status") . "</th><td>";
		if ( $form['accountactive'] == 'true' )
			{
			echo "<span style=\"color:green\">Active</span>";
			echo "<input type=\"radio\" name=\"accountactive\" value=\"true\" checked> /";
			echo "<span style=\"color:red\">Inactive</span>";
			echo "<input type=\"radio\" name=\"accountactive\" value=\"false\">";
			}
		else
			{
			echo "<span style=\"color:green\">Active</span>";
			echo "<input type=\"radio\" name=\"accountactive\" value=\"true\"> /";
			echo "<span style=\"color:red\">Inactive</span>";
			echo "<input type=\"radio\" name=\"accountactive\" value=\"false\" checked>";
			}
		echo "</td></tr>";
		}

	
	if ( $form['accounttype'] == 'U' && $user['type'] != 'U' )
		{
		echo "<tr><th>" . help ("Mailbox Limit","ea_mlimit") . "</th><td>";
		echo "<input type=\"text \"size=\"5\" name=\"accountmlimit\" value=\"$form[accountmlimit]\">";
		echo "</td><tr>";
		}
	else
		{
		echo "<input type=\"hidden\" name=\"accountmlimit\" value=\"$form[accountmlimit]\">";
		}

	if ( $form['accounttype'] == 'A' )
		{
		// $domains holds the list of all domains
		// $accountdomains holds the list of domains accessible by the administrator

		$accountdomains = load_domain_list ('A', $form['accountid']);
		echo "<tr><th>" . help ("Domain Access","ea_da") . "</th><td>";
		if ( count ($domains) > 10 ) { $size = 10; }
		else                 		 { $size = count ($domains); }          

		echo "<select name=\"access[]\" multiple size=\"$size\">";
		foreach ( $domains as $k=>$v)
			{
			echo "<option value=\"$k\"";
			if ( array_key_exists ($k, $accountdomains) ) { echo " selected"; }
			echo ">$v</option>";
			}
		echo "</select>";
		echo "</td></tr>";
		}

	if ( $user['type'] == 'U' )
		{
		echo "<tr><th>" . help ("User Notes", "ea_unotesu") . "</th><td>";
		echo "<textarea rows=\"5\" cols=\"40\" name=\"accountunotes\">";
		echo $form['accountunotes'];
		echo "</textarea>";
		echo "</td></tr>";
		}
	else
		{
		echo "<tr><th>" . help ("User Notes", "ea_unotesa") . "</th><td>";
		echo "<textarea rows=\"5\" cols=\"40\" name=\"accountunotes\">";
		echo $form['accountunotes'];
		echo "</textarea>";
		echo "</td></tr>";

		echo "<tr><th>" . help ("Administrator Notes","ea_anotesa") . "</th><td>";
		echo "<textarea rows=\"5\" cols=\"40\" name=\"accountanotes\">";
		echo $form['accountanotes'];
		echo "</textarea>";
		echo "</td></tr>";
		}

	if ( $form['accounttype'] == 'U' && $user['type'] != 'U' )
		{
		if ( count ($form['forwardfrom']) != 0 )
			{
			echo "<tr><th>" . help ("Delete Forwards", "ea_delfwd") . "</th><td>";
			echo "Select to delete a forwarding address for this account";
			echo "<table>";
			$to = $form['forwardto'];
			foreach ( $form['forwardfrom'] as $k => $v )	
				{
				echo "<tr><td><input type=\"checkbox\" name=\"delfwd[]\" value=\"$k\">" .
					 "</td><td>$v:<br>$to[$k]</td></tr>";
				}
			echo "</table></td></tr>";
			}

		echo "<tr><th>" . help("Create New Forward","ea_newfwd") . "</th><td>";
		echo "<table>";
		echo "<tr><th>" . help ("From","ea_from") . "</th><td><input name=\"newfwdfrom\" size=\"30\"></td></tr>";
		echo "<tr><th>" . help ("To","ea_to") . " </th><td><input name=\"newfwdto\" size=\"30\"></td></tr>";
		echo "</table>";
		echo "</td></tr>";
		}

	echo "<tr><td colspan=\"2\">";
	echo "<input type=\"submit\" name=\"submit\" value=\"Update Account\">";
	echo "</td></tr>";

	echo "</table>";
	echo "</form>";

	if ( $user['type'] != 'U' )
		{
		echo "<form action=\"$_SERVER[PHP_SELF]\" method=\"post\">";
		echo "<input type=\"hidden\" name=\"action\" value=\"delete\">";
		echo "<input type=\"hidden\" name=\"accountid\" value=\"$form[accountid]\">";
		echo "<input type=\"hidden\" name=\"accountdomain\" value=\"$form[accountdomain]\">";
		echo "<input type=\"submit\" name=\"submit\" value=\"Delete This Account\">";
		echo "</form>";
		}
}

/************************************************************
	Begin page
*/
manage_session ();

// Load the domain lists for this user
$domains = load_domain_list ($user['type'], $user['id']);

// Create a new account
if ( $_GET['accountid'] == "new" )
	{
	// Make sure user accounts aren't trying to create
	if ( $user['type'] == 'U' ) 
		{ error_page ("User not authorized for this page."); }
	
	// Get the domain id and make sure user has access to it
	if ( ! isset ($_GET['domainid']) ) 
		{ error_page ("Domain id not set."); }

	if ( ! array_key_exists ($_GET['domainid'], $domains) )
		{ error_page ("Invalid domain identifier."); }

	$action = $form['action'] = "create";
	$domainid = $form['domainid'] = $_GET['domainid'];
	$domainname = $domains[$domainid];
	$accountname = "new";
	$accountid = 0;
	$accounttype = 0;

	include ("templates/editaccount.template");
	}

// Edit an existing account
elseif ( isset ($_GET['accountid']) )
	{
	// Load the data for this account
	load_data ( $_GET['accountid'] );

	// Make sure the user can edit this account
	if ( $user['type'] == 'U' && $_GET['accountid'] != $user['id'] )
		{
		error_page ("User not authorized to edit account.");
		}
	elseif ( $user['type'] == 'A' && 
			 ! array_key_exists ($form[accountdomain], $domains) )
		{
		error_page ("User not authorized to edit account.");
		}

	$action = "edit";
	$accountname = $form['accountname'];
	$accountid = $form['accountid'];
	$accounttype = $form['accounttype'];
	include ("templates/editaccount.template");
	}

elseif ( $_POST['action'] == "update" )
	{
	update_account ();
	if ( $user['type'] == 'U' )     { redirect ("editaccount.php?accountid=$user[id]"); }
	else                            { redirect ("accounts.php?domainid=$_POST[accountdomain]"); }
	}
elseif ( $_POST['action'] == "create" )
	{
	create_account ();
	if ( $_POST['accounttype'] == 'U' )
		{ redirect ("editmbx.php?mbx=default&account=$_POST[accountid]"); }
	else
		{ redirect ("accounts.php?domainid=$_POST[accountdomain]"); }
	}
elseif ( $_POST['action'] == "delete" )
	{
	delete_account ();
	redirect ("accounts.php?domainid=$_POST[accountdomain]");
	}
else
	{
	error_page ("Invalid operation");
	}
?>
