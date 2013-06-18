<head>
    <meta name="viewport" content="width=device-width"/>
</head>

<?php

/************************************************************
	VIEW AND SELECT FORWARDING ADDRESSES TO EDIT
*/
require_once ("session.php");

/************************************************************
	Draw the form to select the forward addresses
*/
function forward_form ()
{
	echo "<form action=\"$_SERVER[PHP_SELF]\" method=\"post\">";
	echo "<table>";

	echo "<tr><th>" .  help ("From or To address contains","fw_fromto"). "</th>";
	echo "<td><input type=\"text\" size=\"15\" name=\"like\" value=\"$_POST[like]\"></td>";
	
	echo "<tr><th>" . help ("Show All", "fw_all") . "</th>";
	if ($_POST['all'] == 'on') { $checked = "checked"; } else { $checked = ""; }
	echo "<td><input type=\"checkbox\" name=\"all\" $checked></td>";

	echo "<tr><td colspan=\"2\">";
	echo "<input type=\"submit\" name=\"submit\" value=\"Update List\">";
	echo "</td></tr>";

	echo "</table>";
	echo "</form>";
}

/************************************************************
	Fetch the domain list from the query and call the
	template to display them.
*/
function forward_list ()
{
	global $query_handle;

	while ( $row = mysql_fetch_row ($query_handle) )
		{
		$link	= "editaccount.php?accountid=$row[0]";
		$from   = $row[1];
		$to     = $row[2];
		include ("templates/forward_item.template");
		}
}

/************************************************************
	Begin page
*/
manage_session();

// Only the master administrator gets to see this page
if ( $user['type'] == 'U' )
	{
	error_page ("User not authorized for this page.");
	}

if ( $user['type'] == 'M' )
	{
	$query = 
		"SELECT AccountId, FromAddress, ToAddress " .
		"FROM $table[aliases] ";
	$and = "WHERE";
	}
else
	{
	$query =
		"SELECT F.Accountid, F.FromAddress, F.ToAddress " .
		"FROM $table[aliases] as F, $table[access] as A " .
		"WHERE A.DomainId = F.DomainId " .
		"AND A.AccountId = '$user[id]' ";
	$and = "AND";
	}

if ( $_POST['like'] != "" )
	{
	$query .= 
		"$and (FromAddress like '%$_POST[like]%' OR " .
			 "ToAddress like '%$_POST[like]%') ";
	}
	
if ($_POST['all'] != 'on') {
		$query .= "LIMIT $forwardlimit";
}

$query .= ";";

$query_handle = do_query ($query);
$query_count = mysql_num_rows($query_handle);
// The template file calls domain_list()
include ("templates/forwards.template");

?>
