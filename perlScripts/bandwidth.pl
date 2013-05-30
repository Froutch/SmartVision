#!/usr/bin/perl -w
use strict;

my $traficIn = `snmpget -v 1 -c public localhost .ifInOctets.2`;
my $traficOut = `snmpget -v 1 -c public localhost .ifOutOctets.2`;

my @traficI = split(/ +/, $traficIn);
my @traficO = split(/ +/, $traficOut);

my $i=0;
while ($i < 11)
{
	system `rrdtool update ./bandwidth.rrd N:$traficI[3]`;
	system `rrdtool update ./bandwidth2.rrd N:$traficO[3]`;
	$i++;
	sleep 5;
}
system `rrdtool graph /var/www/guigui/graph/traffic_heure.png --start -3600 --vertical-label bps DEF:inoctets=/var/www/guigui/perlScripts/bandwidth.rrd:buffer:AVERAGE DEF:outoctets=/var/www/guigui/perlScripts/bandwidth2.rrd:buffer:AVERAGE CDEF:inbps=inoctets,8,\* CDEF:outbps=outoctets,8,\* AREA:inbps#00FF00:"Traffic entrant" LINE1:outbps#0000FF:"Traffic sortant"`;

#print ("Octets In : $traficI[3]");
#print ("Octets Out : $traficO[3]");
