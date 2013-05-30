#!/usr/bin/perl -w

use strict;
use warnings;
use Math::Pari;
use Net::SSH::Perl;

if(my $ssh = Net::SSH::Perl->new($ARGV[0]))
{
	
	if($ssh->login($ARGV[1], $ARGV[2]))
	{
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
