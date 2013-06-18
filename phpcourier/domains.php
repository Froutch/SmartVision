<head>
    <meta name="viewport" content="width=device-width"/>
</head>

<?php

/************************************************************
	VIEW AND SELECT DOMAINS TO EDIT
*/
require_once ("session.php");

/************************************************************
	Draw the form to select the domains
*/
function domain_form ()
{
	echo "<form action=\"$_SERVER[PHP_SELF]\" method=\"post\">";
	echo "<table>";

	echo "<tr><th>" . help("Name Contains", ds_nmc) . "</th>";
	echo "<td><input type=\"text\" size=\"15\" name=\"like\" value=\"$_POST[like]\"></td>";

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
function domain_list ()
{
	global $query_handle;

	while ( $row = mysql_fetch_row ($query_handle) )
		{
		$link	= "editdomain.php?domain=$row[0]";
		$name	= $row[1];
		$uid	= $row[2];
		$gid	= $row[3];
		$home	= $row[4];
		$quota	= $row[5];
		$mlimit = $row[6];
		$alimit	= $row[7];

		include ("templates/domain_item.template");
		}
}

/************************************************************
	Begin page
*/
manage_session();

// Only the master administrator gets to see this page
if ( $user['type'] != 'M' )
	{
	error_page ("User not authorized for this page.");
	}

$query = 
	"SELECT DomainId, DomainName, Uid, Gid, Directory, Quota, " .
	"       MailboxLimit, AliasLimit " . 
	"FROM $table[domains] ";

if ( $_POST['like'] != "" )
	{
	$query .= "WHERE DomainName like '%$_POST[like]%' ";
	}
$query .= "ORDER BY DomainName;";

$query_handle = do_query ($query);

// The template file calls domain_list()
include ("templates/domains.template");

?>
