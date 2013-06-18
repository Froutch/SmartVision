<?php

/************************************************************
	Functions called from layout scripts. These functions
	are concerned only with the visual appearnace of the
	pages.
*/

/************************************************************
	Open/close the page
*/
function open_page ($title)
{
	echo "<html><head><title>$title</title>";
	include ("style.php");
	include ("javascript.php");
	echo "<body>";
}
function close_page ()
{
	echo "</body></html>";
}

/************************************************************
	Make a table to hold the menu of links for the TOP of a page.
*/
function make_top_menu ($options)
{
        if ( count ($options) == 0 ) { return; }

        echo "<table class=\"topmenu\"><tr>";
        foreach ($options as $k=>$v)
                {
                echo "<td class=\"topmenucell\">";
                echo "<a class=\"topmenuitem\" href=\"$v\">";
                echo "$k</a></td>";
                }
        echo "</tr></table>";
}

/************************************************************
	Make a table to hold the menu of links for a page.
*/
function make_menu ($options)
{
	global $user;

	if ( count ($options) == 0 ) { return; }

	echo "<table class=\"menu\">";
	echo "<tr><td class=\"menuname\">";
	echo "<i>Logged in as:</i><BR><span class=\"menuitem\"> &nbsp; &nbsp; $user[name]</span>";
	echo "</td></tr>";
	foreach ($options as $k=>$v)
		{
		echo "<tr><td class=\"menucell\">";
		echo "<a class=\"menuitem\" href=\"$v\">";
		echo "$k</a></td></tr>";
		}
	echo "</table>";
}

/************************************************************
	Open/close the standard layout table.
*/
function open_content ($heading, $menu = 0, $topmenu = 0)
{
	echo "<table class=\"layout\"><tr>";
	
	// MENU CELL
	echo "<td valign=\"top\">";
	include ("logo.template");
	echo "<br>";
	if ( is_array ($menu) ) { make_menu ($menu); }
	echo "</td>";

	// DATA CELL
	echo "<td valign=\"top\"><span class=\"heading\">$heading</span><br>";

	if ( is_array ($topmenu) ) 
		{
		make_top_menu ($topmenu);
		}
}

function close_content ()
{
	echo "</td></tr></table>";
}

/************************************************************
	Make the default navigation menu array based on the
	user type.
*/
function top_menu ($items = 0)
{
	$top = array ();
	// Add additional items
	if ( is_array ($items) ) {
		foreach ( $items as $k=>$v ) {
			$top[$k] = $v;
		}
	}

	return $top;
}

/************************************************************
	Make the default navigation menu array based on the
	user type.
*/
function nav_menu ($items = 0)
{
	global $user;
	$nav = array ();

	//$nav['&nbsp;'] = "";
	if ( $user['type'] == 'M' )
		{
		$nav['Account List'] = "accounts.php";
		$nav['Domain List'] = "domains.php";
		$nav['Forward List'] = "forwards.php";
		$nav['View Logs'] = "logs.php";
		}
	elseif ( $user['type'] == 'A' )
		{
		$nav['Account List'] = "accounts.php";
		$nav['Forward List'] = "forwards.php";
		}

	// Add additional items
	if ( is_array ($items) )
		{
		foreach ( $items as $k=>$v )
			{
			$nav[$k] = $v;
			}
		}

	// Add the logout menu
	$nav['Logout'] = "logout.php";

	return $nav;
}

?>
