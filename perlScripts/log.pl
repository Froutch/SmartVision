#!/usr/bin/perl -w

use strict;
use warnings;
use Math::Pari;
use Net::SSH::Perl;
use Net::SCP qw(scp iscp);
use Net::SCP::Expect;

if(my $ssh = Net::SSH::Perl->new($ARGV[0]))
{
	
	if($ssh->login($ARGV[1], $ARGV[2]))
	{
		$ssh->cmd("mkdir /var/www/scripts");

		my $scpe = Net::SCP::Expect->new(host=>$ARGV[0], user=>$ARGV[1], password=>$ARGV[2]);
		$scpe->scp('/root/.ssh/sv_key.pub','/root/.ssh');

		my $scpe2 = Net::SCP::Expect->new(host=>$ARGV[0], user=>$ARGV[1], password=>$ARGV[2], recursive=>'1');
		$scpe2->scp('/var/www/salman/perlScripts/','/var/www/scripts');

		$ssh->cmd("cat /root/.ssh/sv_key.pub >> /root/.ssh/authorized_keys");

		print"2";
		$ssh->sock;
	}
	else
	{
		print"1";
	}
}
else
{
	print"0";
}
