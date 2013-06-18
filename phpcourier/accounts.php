<head>
    <meta name="viewport" content="width=device-width"/>
</head>

<?php

/************************************************************
	VIEW AND SELECT ACCOUNTS TO EDIT
*/
require_once ("session.php");

/************************************************************
	Load the list of domains this user can see.
*/
function load_domain_list ()
{
	global $user, $table;
	$domainlist = array ();
	
	// Select all the domains that exist
	if ( $user['type'] == 'M' )
		{
		$query = "SELECT DomainId, DomainName FROM $table[domains] ORDER BY DomainName";
		}

	// Select only the domains visiable to this admin
	else
		{
		$query =
			"SELECT D.DomainId, D.DomainName " .
			"FROM $table[domains] as D, $table[access] as A " .
			"WHERE D.DomainId = A.DomainId " .
			"AND A.AccountId = '$user[id]' ORDER BY D.DomainName;";
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
	Draw the account form.
*/
function account_form ()
{
	global $user, $table, $domainlist, $defaultdomain;
	global $query_handle;

	echo "<form name=\"frmAccount\" action=\"$_SERVER[PHP_SELF]\" method=\"post\">";
	if (isset($_POST['alpha'])) {
		echo "<input type=\"hidden\" name=\"alpha\" value=\"$_POST[alpha]\">";
	}
	echo "<table>";

	// Select domain
	if ( count ($domainlist) > 1 )
		{
		echo "<tr><th>" . help ("Choose Domain","as_chd") . "</th>";
		
		echo "<td><select name=\"domainid\" onchange=\"this.form.submit();\">";
	
		foreach ( $domainlist as $k=>$v )
			{
			echo "<option";
			if ( $_POST['domainid'] == $k ) { echo " selected"; }
			echo " value=\"$k\">$v</option>";
			}
		echo "</select></td></tr>";
		echo "<tr><td colspan=2><hr></td></tr>";
		}
	echo "<tr><th>" . help ("Name contains","as_nmcnt") . "</th>";
	echo "<td><input type=\"text\" size=\"30\" name=\"like\" " .
		 "value=\"$_POST[like]\" onchange=\"this.form.submit();\"></td>";

	echo "<tr><th>" . help ("Status", "as_status") . "</th>";
	echo "<td><select name=\"active\" onchange=\"this.form.submit();\">";
	$opts = array ("all" => "All Accounts", "true"  => "Active Accounts", "false" => "Inactive Accounts");
	foreach ($opts as $k=>$v) {
		echo "<option";
		if ( $_POST['active'] == $k ) { echo " selected"; }
		echo " value=\"$k\">$v</option>";
	}

	echo "</select></td></tr>";
	
	if ( $user['type'] == 'M' )
		{
		// Select account type - default to administrators
		echo "<tr><th>" . help ("Account Type","as_accty") . "</th>";
		echo "<td><select name=\"type\" onchange=\"this.form.submit();\">";
		$opts = array ("user"  => "User Accounts", "admin" => "Administrators");
		foreach ($opts as $k=>$v)
			{
			echo "<option";
		 	if ( $_POST['type'] == $k ) { echo " selected"; }
			echo " value=\"$k\">$v</option>";
			}

		echo "</select></td></tr>";
		}


	echo "<tr><th>" . help ("Order By","as_order") . "</th><td>";
	echo "<select name=\"order\" onchange=\"this.form.submit()\">";
	$opts = array ("AccountName" => "Account Name",
                   "FullName" => "Full Name",
				   "EditWhen" => "Last Edit Date");
	foreach ($opts as $k=>$v)
		{
		echo "<option";
	 	if ( $_POST['order'] == $k ) { echo " selected"; }
		echo " value=\"$k\">$v</option>";
		}

	echo "</select></td></tr>";

	echo "<tr><th>" . help ("Names per page","as_perpage") . "</th><td>";
	echo "<input type=\"text\" size=\"5\" name=\"perpage\" value=\"$_POST[perpage]\" ";
	echo "onchange =\"this.form.submit();\">";
	echo "</td></tr>";

	echo "<tr><td colspan=\"2\">";
	echo "<input type=\"submit\" name=\"update\" value=\"Update List\">";
	echo "</td></tr>";

	echo "</table>";
	echo "</form>";

}

/************************************************************
	Draw the ABC selector set of links
*/
function account_abc ()
{
	if ( $_POST['order'] == "EditWhen" ) 
		{ $select = "AccountName"; }
	else
		{ $select = $_POST['order']; }

	echo "<span class=\"abc_lable\">" . help ($select,"as_abc") . ":</span> ";

	$args = array ("domainid", "like", "active", "type", "order", "perpage");
	for ( $ascii = '65'; $ascii < '91'; $ascii ++ )
		{	
		$letter = chr ($ascii);
		$href=$_SERVER['PHP_SELF'];
		$sep = "?";
		foreach ($args as $a)
			{
			$href .= $sep . "$a=$_POST[$a]";
			$sep = "&";
			}
		$href .= $sep . "alpha=$letter";
		if (isset($_POST['alpha']) && $_POST['alpha'] == $letter)
			{
			$class = "abcselect";
			}
		else 
			{
			$class = "abc"; 
			}

		echo "<a class=\"$class\" href=\"$href\"> $letter </a>";
		}
			
		$href=$_SERVER['PHP_SELF'];
		$sep = "?";
		foreach ($args as $a)
			{
			$href .= $sep . "$a=$_POST[$a]";
			$sep = "&";
			}
		$href .= $sep . "alpha=all";
		echo " - <a class=\"abc\" href=\"$href\"> ALL </a>";
}

/************************************************************
	This function is called from the account_pages function
	to set up the forms that are passed in the $pages array
	to the account_pages.temlate file. The form includes
	all the same information from the full form, plus
	the limit variable, which is added to the select statement.
*/
function make_page_form ($pagenum, $label)
{
	$form  = "<form class=\"buttonform\" action=\"$_SERVER[PHP_SELF]\" method=\"POST\">";

	// Copy values from the last submission
	$copy = array ("like", "type", "domainid", "total", "order", "perpage");
	foreach ($copy as $c )
		{
		if ( isset ($_POST[$c]) )
			{
			$form .= "<input type=\"hidden\" name=\"$c\" value=\"$_POST[$c]\">";
			}
		}

	// Now add the limit field - The limit command uses 0-based row numbers
	$first = (($pagenum-1) * $_POST['perpage']);
	$form .= "<input type=\"hidden\" name=\"limit\" value=\"$first\">";

	// Report the current page number
	$form .= "<input type=\"hidden\" name=\"curpage\" value=\"$pagenum\">";

	// And now the submit button
	$form .= "<input type=\"submit\" name=\"submit\" value=\"$label\">";

	$form .= "</form>";
	return $form;
}

/************************************************************
	Draw the navigation buttons
*/
function account_pages ()
{
	$numpages = (int) (floor (($_POST['total']-1)/$_POST['perpage'])) + 1;

	$pages = array ();
	for ( $p = 1; $p <= $numpages; $p++ )
		{
		$pages[$p] = make_page_form ($p, "$p");
		}

	if ( $_POST['curpage'] != 1 )
		{ 
		$pages['prev'] = make_page_form ($_POST['curpage']-1, "Back");
		}

	if ( $_POST['curpage'] != $numpages )
		{
		$pages['next'] = make_page_form ($_POST['curpage']+1, "Next");
		}

	$total = $_POST['total'];
	$first = (($_POST['curpage']-1) * $_POST['perpage'])+1;
	$last  = $first + $_POST['perpage']-1;
	if ( $last > $total ) { $last = $total; }
	$curpage = $_POST['curpage'];
	include ("templates/account_pages.template");
}

/************************************************************
	This function builds the complex query to retrieve
	the list of accounts.
*/
function query_for_list ()
{
	global $table, $user;
	global $query_handle;

	if ( $user['type'] == 'A' )
		{
		// Only view user accounts in the current domain
		$query =
			"SELECT " .
			"   Acct.AccountId, Acct.AccountName, Acct.AccountType, " .
			"	Acct.FullName, Acct.ClearPass, " .
			"   Creator.AccountName, Acct.EditWhen, Acct.Active, " .
			"	Acct.CompanyName, Acct.PhoneNumber " .
			"FROM " .
			"   $table[accounts] AS Acct, $table[accounts] AS Creator " .
			"WHERE Acct.EditBy = Creator.AccountId " .
			"AND Acct.AccountType = 'U' " . 
			"AND Acct.DomainId = '$_POST[domainid]' ";
		}
	else
		{
		// Master administrators can view both types
		switch ( $_POST['type'] )
			{
			case "admin":
				// View all administrators assigned to the given domain
				$query =
					"SELECT " .
					"   Acct.AccountId, Acct.AccountName, Acct.AccountType, " .
					"	Acct.FullName, Acct.ClearPass, " .
					"   Creator.AccountName, Acct.EditWhen, Acct.Active, " .
					"	Acct.CompanyName, Acct.PhoneNumber " .
					"FROM " .
					"   $table[accounts] AS Acct, $table[accounts] AS Creator, " .
					"	$table[access] AS DA " .
					"WHERE Acct.EditBy = Creator.AccountId " .
					"AND Acct.AccountId = DA.AccountId " .
					"AND Acct.AccountType = 'A' " .
					"AND DA.DomainId = '$_POST[domainid]' ";
				break;

			case "user":
				$query =
					"SELECT " .
					"   Acct.AccountId, Acct.AccountName, Acct.AccountType, " .
					"	Acct.FullName, Acct.ClearPass, " .
					"   Creator.AccountName, Acct.EditWhen, Acct.Active, " .
					"	Acct.CompanyName, Acct.PhoneNumber " .
					"FROM " .
					"   $table[accounts] AS Acct, $table[accounts] AS Creator " .
					"WHERE Acct.EditBy = Creator.AccountId " .
					"AND Acct.AccountType = 'U' " .
					"AND Acct.DomainId = '$_POST[domainid]' ";
				break;
			}

		}

	// Add domain selection
	if ( $_POST['active'] != "all" ) {
		$query .= "AND Acct.Active = '$_POST[active]' ";
	}

	// Name content
	if ( $_POST['like'] != "" )
		{
		$query .= "AND (Acct.AccountName LIKE '%$_POST[like]%' OR Acct.FullName LIKE '%$_POST[like]%') ";
		}

	// Check for a starting letter
	if ( isset ($_POST['alpha']) && $_POST['alpha'] != "all" )
		{
		if ( $_POST[order] == 'EditWhen' )
			{ $query .= "AND Acct.AccountName LIKE '$_POST[alpha]%'"; }
		else
			{ $query .= "AND Acct.$_POST[order] LIKE '$_POST[alpha]%'"; }
		}

	// Set the sort order
	if ( $_POST['order'] == "EditWhen" ) { $ad = "DESC "; } else { $ad = "ASC"; }
	$query .= "ORDER BY Acct.$_POST[order] $ad ";

	// Is there a limit clause from a navigation form?
	if ( isset ($_POST['limit']) )
		{
		$query .= "LIMIT $_POST[limit], $_POST[perpage] ";
		}

	$query .= ";";

	$query_handle = do_query ($query);
}

/************************************************************
	Draw the account list
*/
function account_list ()
{
	global $query_handle, $table, $showsize, $domainid;

	$count = 0;
	while ( $row = mysql_fetch_row ($query_handle) )
		{
		$maillink	= "mailboxes.php?accountid=$row[0]";
		$link 		= "editaccount.php?accountid=$row[0]";
		$deletelink	= "editaccount.php?action=delete&accountid=$row[0]&accountdomain=$domainid";
		$name 		= $row[1];
		$type 		= $row[2];
		$fullname	= $row[3];
		$pwd		= $row[4];
		$editby 	= $row[5];
		$editwhen	= $row[6];
		$active		= $row[7];
		$company	= $row[8];
		$phone		= $row[9];
		$size		= "";
		$lastaccess	= "";

		// Get Maildir path
		 if ($showsize == "true") {
			$query2 = "SELECT HOME FROM $table[mailboxes] WHERE AccountId = $row[0];";
			$queryHandle2 = do_query ($query2);

			while ( $mailrow = mysql_fetch_row ($queryHandle2) ) { $maildir = $mailrow[0]; }
			if (file_exists($maildir)) {	
			$size = exec("du -sh $maildir");
			list($size, $temp) = split("\t", $size);
			$lastaccess = filectime("$maildir/Maildir/new");
			$lastaccess = date ("Y-m-d H:i:s", $lastaccess); 
			}
			else { $size = ""; $lastaccess = ""; }
		}
		
		include ("templates/account_item.template");

		$count++;

		if ( $count == $_POST['perpage'] ) { break; }
		}
}

/************************************************************
	Begin page
*/
manage_session ();
if ( $user['type'] == 'U' )
	{
	error_page ("User not authorized for this page.");
	}

// Load the domain name list
$domainlist = load_domain_list ();
if ( count ($domainlist) == 0 )
	{
	error_page ("No domains are accessible");
	}

// Check for a click from a letter
if ( isset ($_GET['alpha']) )
{
	// Copy from GET to POST
	$_POST['domainid'] = $_GET['domainid'];
	$_POST['like'] = $_GET['like'];
	$_POST['active'] = $_GET['active'];
	$_POST['type'] = $_GET['type'];
	$_POST['perpage'] = $_GET['perpage'];
	$_POST['alpha'] = $_GET['alpha'];	
	$_POST['order'] = $_GET['order'];	
}

// Set the defaults
if ( ! isset ($_POST['type']) )
	{
	// What types of accounts should be shown by default?
	// This only appears for the master administrator
	$_POST['type'] = "user"; 
	}

// Select the domain to view and make sure it's valid
if ( ! isset ($_POST['domainid']) )
{
	if ( isset ($_GET['domainid']) && $_GET['domainid'] != 0 )
		{
		if ( ! array_key_exists ($_GET['domainid'], $domainlist))
			{ error_page ("Invalid domain"); }
		$_POST['domainid'] = $_GET['domainid'];
		}
	else
		{
		// Select the first one
		reset ($domainlist);

		$_POST['domainid'] = key ($domainlist);

                if ($defaultdomain != "") {
                        foreach ( $domainlist as $k=>$v ) {
                                if ($k == $defaultdomain) { $_POST['domainid'] = $defaultdomain; }
                        }
                }
		
		}
}

// Set Default for Active or Inactive account viewing
if ( ! isset ($_POST['active']) ) {
	$_POST['active'] = "all" ;
}

// Clear the like field
if ( ! isset ($_POST['like']) ) { 
	$_POST['like'] = ""; 
}

// Set the default sort order
if ( ! isset ($_POST['order']) ) {
	$_POST['order'] = "AccountName";
}
/*else {
	if ($_POST['order'] == "EditWhen") {
		$_POST['alpha'] = "";
	}	
}*/

// Accounts per page - default to $maxscreen from globals.php
if ( ! isset ($_POST['perpage']) )
{
	// Number of accounts to show per page
	$_POST['perpage'] = $maxscreen ;
}
elseif ( $_POST['perpage'] <= 0 )
{
	$_POST['perpage'] = 1;
}

// The query is done here, and the fetch rows is done in the
// account_list function
query_for_list ();

if ( ! isset ($_POST['total']) )
{
	// Get the total number of rows for this query.
	// The navigation buttons will forward this on
	// with the other search parameters
	$_POST['total'] = mysql_num_rows ($query_handle);
	$_POST['curpage'] = 1;
}

// The template file calls account_form(), account_pages(),
// and account_list()
$domain = $domainlist[$_POST['domainid']];
$domainid = $_POST['domainid'];
include ("templates/accounts.template");

?>
