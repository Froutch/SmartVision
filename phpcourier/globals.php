<head>
    <meta name="viewport" content="width=device-width"/>
</head>

<?php
// Global variables used throughout the system

// Session data
$session['cookie_name']		= "PHPCOURIER_SESSID";
$session['expire_sec']		= 3600;

// Mysql information
$mysql['host']				= "localhost";
$mysql['username']			= "root";
$mysql['password']			= "pisvs4";
$mysql['database']			= "phpcourier";

// Table names
$table['domains']			= "Domains";
$table['accounts']			= "Accounts";
$table['access']			= "DomainAccess";
$table['mailboxes']			= "Mail";
$table['aliases']			= "Aliases";
$table['update']			= "UpdateTime";
$table['sessions']			= "Sessions";
$table['forwards']			= "Forwards";

// Information about the current user
$user['id']					= "";
$user['name']				= "";
$user['type']				= "";
$user['domain']				= "";
$user['expire']				= "";

// Owner Information and other options
$commongrp				= "vmail";
$maxscreen				= "100";
$virthome				= "/home/vmail";
$allowspecifyvirthome			= "false";
$forwardlimit				= "50";
$defaultdomain				= "1";

// Show Maildir Size?
$showsize				= "false";

// Log Information Settings
$cmdLog1                                = "tail -100 /var/log/maillog | tac";
$cmdLog2                                = "tail -10000 /var/log/maillog | grep -m 100 pop3 | tac";
$cmdLog3                                = "tail -30000 /var/log/maillog | grep -m 100 error | tac";

// Commands
$mdm_cmd					= "/usr/lib/courier/bin/maildirmake";

?>
