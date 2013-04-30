#!/usr/bin/perl -w

use strict;
use warnings;

my $toto = `route | grep default`;

$toto =~ s/\s{2,}/\//g;
$toto =~ s/ /\//g;

my @titi = split('/', $toto);

print "$titi[1]\n";
