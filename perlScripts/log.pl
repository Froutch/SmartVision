#!/usr/bin/perl -w

use strict;
use warnings;
use Math::Pari;
use Net::SSH::Perl;

my $ssh = Net::SSH::Perl->new("10.8.105.31");
$ssh->login("root", "aloha");

