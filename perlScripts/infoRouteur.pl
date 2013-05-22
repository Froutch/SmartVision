#!/usr/bin/perl -w

use strict;

#recuperation du taux de transmission, debits, et paquets rejetes

my @items = ("ifSpeed.1", "ifInOctets.2", "ifOutOctets.2","ifInErrors.2");
foreach my $item (@items)
{
	my $request = `snmpget -v 1 -c $ARGV[0] $ARGV[1] $item`;
	my @request = split (/ +/, $request);
	my $result = ("$item ="." $request[3] <br/>"); # <br/> pour php/html, retirer si shell
	print "$result";
}
