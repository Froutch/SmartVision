#!/usr/bin/perl -w
use strict;

my $traficIn = `snmpget -v 1 -c public localhost .ifInOctets.2`;
my $traficOut = `snmpget -v 1 -c public localhost .ifOutOctets.2`;

my @traficI = split(/ +/, $traficIn);
my @traficO = split(/ +/, $traficOut);

print ("Octets In : $traficI[3]");
print ("Octets Out : $traficO[3]");
