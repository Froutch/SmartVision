#!/usr/bin/perl -w
use strict;

#Script affichant le pourcentage de mémoire vive utilisé

my $totalTmp = `snmpget -v 1 -c public localhost .hrStorageSize.1`;
my $usedTmp = `snmpget -v 1 -c public localhost .hrStorageUsed.1`;

my @total = split (/ +/, $totalTmp);
my @used = split(/ +/, $usedTmp);

my $pct = (($used[3]/$total[3])*100);
$pct = sprintf("%.2f", $pct);
print ("$pct\% mémoire utilisé\n");
