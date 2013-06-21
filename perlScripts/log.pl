#!/usr/bin/perl -w

use warnings;
use strict;
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

		my $scpe3 = Net::SCP::Expect->new(host=>$ARGV[0], user=>$ARGV[1], password=>$ARGV[2], recursive=>'1');
		$scpe3->scp('/var/www/upBandwidth.pl','/var/www/scripts/perlScripts');
		$ssh->cmd("cat /root/.ssh/sv_key.pub >> /root/.ssh/authorized_keys");

		$ssh->cmd("rrdtool create /var/www/scripts/perlScripts/bandwidth.rrd --step 60 DS:in:COUNTER:600:0:10000000000 DS:out:COUNTER:600:0:10000000000 RRA:AVERAGE:0.5:2:800");
		$ssh->cmd("sed '\$i*/1 * * * * root /var/www/scripts/perlScripts/upBandwidth.pl >> /var/www/scripts/perlScripts/rrdtoolLog.txt 2>&1' /etc/crontab >> /etc/crontab");
		$ssh->cmd("/etc/init.d/cron restart");
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
