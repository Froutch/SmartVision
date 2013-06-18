#! /usr/bin/perl

#======================================================================
sub name
{
	my $name = shift;
	my $number = shift;
	
	my $fullname = sprintf ("%s%03d", $name, $number);
	return $fullname;
}


#======================================================================
$domain = 1;
$account = 1;
$mailbox = 1;
$alias = 1;
$admin = 1;
$adminaccount = 1;
$useraccount = 1;
$user = 1;

print "use phpcourier;\n\n";

print "Delete from Domains;\n";
print "Delete from DomainAccess;\n";
print "Delete from Accounts;\n";
print "Delete from Mail;\n";
print "Delete from Aliases;\n";
print "Delete from UpdateTime;\n";
print "Delete from Sessions;\n\n\n";


print "INSERT INTO Accounts\n";
print "(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,EditBy,EditWhen)\n";
print "VALUES\n";
print "('1','0','root', PASSWORD('rootpw'),'rootpw','Root Administrator','M','true','1',NOW());\n\n";

print "INSERT INTO UpdateTime (AliasExtractTime, AliasUpdateTime, DomainUpdateTime, DomainExtractTime)\n";
print "VALUES\n";
print "(NOW(),NOW(),NOW(),NOW());\n\n";

$account++;

# Make domains
for ( $d = 0; $d < 5; $d++ )
{
	$name = name ("domain", $domain);
	
	$domainname = "$name.com";
	$domainhome = "/home/daniell/domains/$name";
	
	print "INSERT INTO Domains\n";
	print "(DomainId,Domainname,Uid,Gid,Directory,Quota,MailboxLimit,AliasLimit,EditBy,EditWhen)\n";
	print "VALUES\n";
	print "('$domain','$domainname','60','60','$domainhome','100','5','5','1',NOW());\n\n";
	
	# Make an administrator for each domain
	$name = name("admin", $admin);
	$pw = $name . "pw";
	print "INSERT INTO Accounts\n";
	print "(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,EditBy,EditWhen)\n";
	print "VALUES\n";
	print "('$account','0','$name',PASSWORD('$pw'),'$pw','Administrator $admin'," .
		"'A','true','1',NOW());\n\n";

	# Grant access to this domian
	print "INSERT INTO DomainAccess (AccountId, DomainId) VALUES ('$account','$domain');\n\n";
	
	$adminaccount = $account;
	$account++;
	$admin++;
	
	# Users
	for ( $u = 0; $u < 50; $u++ )
	{
		# Now make the users
		$name = name ("user", $user);
		$pw = $name . "pw";
		print "INSERT INTO Accounts\n";
		print "(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,".
			"Active,MailboxLimit,EditBy,EditWhen)\n";
		print "VALUES\n";
		print "('$account','$domain','$name', PASSWORD('$pw'),'$pw','User $user'," .
			"'U','true','5','$adminaccount',NOW());\n\n";
		
		$useraccount = $account;
		$username = $name;
		
		# Do mailboxes and aliases
		for ( $m = 1; $m <= 2; $m++ )
		{
			$name = $username . "-" . name ("mbx", $m);
			$pw = $name . "pw";
			
			print "INSERT INTO Mail\n";
			print "(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,".
				"Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)\n";
			print "VALUES\n";
			print "('$mailbox','$account','$domain','$name','$pw', " . 
				"'$name\@$domainname', 'User $user', '60', '60', '100', '$domainhome/$name', '5', '$account',NOW());\n\n";

			for ( $a = 1; $a <=2; $a++ )
			{
				$aliasname = $name . "-" . $a;
				
				print "INSERT INTO Aliases\n";
				print "(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)\n";
				print "VALUES\n";
				print "('$alias','$mailbox','$useraccount','$domain','$aliasname','$useraccount',NOW());\n\n";
				
				$alias++;
			}
			
			$mailbox++;
		}
		
		
		$user++;
		$account++;
	}

	$domain++;
}
