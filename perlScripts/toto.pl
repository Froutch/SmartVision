#!/usr/bin/perl -w

use strict;
use warnings;
use Net::SCP qw(scp iscp);
use Net::SCP::Expect;

my $scpe = Net::SCP::Expect->new(host=>'10.8.107.27', user=>'root', password=>'bankster', recursive=>'1');

$scpe->scp('/var/www/salman/perlScripts/','/var/www/');
