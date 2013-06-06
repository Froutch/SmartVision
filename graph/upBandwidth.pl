#!/usr/bin/perl -w
use warnings;
use strict;

my $i=0;
my $inO = `snmpget -v 1 -c public -Oqv localhost ifInOctets.2`;
my $outO = `snmpget -v 1 -c public -Oqv localhost ifOutOctets.2`;

$inO =~s/\s+$//;
$outO =~s/\s+$//;

while ($i < 11)
{
	system `rrdtool update /var/www/guigui/graph/bandwidth.rrd N:$inO:$outO`;
	$i++;
	sleep 5;
}

my $toto=`rrdtool graph /var/www/guigui/graph/bandwidth.png --start -3600 --vertical-label bps DEF:inoctets=/var/www/guigui/graph/bandwidth.rrd:in:AVERAGE DEF:outoctets=/var/www/guigui/graph/bandwidth.rrd:out:AVERAGE CDEF:inbps=inoctets,8,\* CDEF:outbps=outoctets,8,\* AREA:inbps#00FF00:"Traffic entrant" LINE1:outbps#0000FF:"Traffic sortant"`;
