#!/usr/bin/perl -w

use strict;
use warnings;
use IO::Socket::PortState qw(check_ports);

my @arp_scan_line;
my @arp_scan_line2;
my @arp_scan_ip;
my @arp_scan_mac;
my @arp_scan_const;
my $arp_scan = `arp-scan -l`;
my $i = 0;
my $j;
my @tmp;
my $os_result;
my @os_tmp;
my $xml;

#test git
my $timeout = 0.05;

my $proto = 'tcp';

my %port_hash = (
        $proto => {
            22     => {},
            80     => {},
            143     => {},
            25     => {},
            53     => {}
            }
        );


@arp_scan_line = split("\n", $arp_scan);
shift(@arp_scan_line);
shift(@arp_scan_line);
pop(@arp_scan_line);
pop(@arp_scan_line);
pop(@arp_scan_line);

foreach $j (@arp_scan_line) 
{
	@arp_scan_line2 = split("\t", $j);
	$arp_scan_ip[$i] = $arp_scan_line2[0];
	$arp_scan_mac[$i] = $arp_scan_line2[1];
	$arp_scan_const[$i] = $arp_scan_line2[2];
	$i++;
}

open (FIC, ">", "scan.xml");
close (FIC);

open (FILE_IN, ">", "scan.xml");


print FILE_IN "<scan>\n";




$i = 0;

foreach $j (@arp_scan_ip)
{

	print FILE_IN "\t<machine>\n";
	my $host = $j;

    # strip off the new line character
    chomp($host);

    # get a hash ref (I think that's the data structure returned)
    my $host_hr = check_ports($host,$timeout,\%port_hash);

    # print whatever host this
	print FILE_IN "\t\t<ip>$host</ip>\n";
	print FILE_IN "\t\t<const>$arp_scan_const[$i]</const>\n";
	print FILE_IN "\t\t<ports>";

    # loop over each key in the hash that matches $proto (tcp), so 22 and 3389
    for my $port (keys %{$host_hr->{$proto}}) {

        # if it's open, say "yes", else say "no"
        my $yesno = $host_hr->{$proto}{$port}{open} ? "yes" : "no";

                # if it's "yes", then print it out
		if ($yesno eq 'yes') {
			print FILE_IN "$port, ";
		}
    }

print FILE_IN "</ports>\n";

$os_result = `xprobe2 -v $host -t 1`;

@os_tmp = split('Running OS: "', $os_result);

@os_tmp = split('"', $os_tmp[1]);

print FILE_IN "\t\t<os>";
if (defined $os_tmp[0] && length $os_tmp[0] > 0)
{ 
	print FILE_IN "$os_tmp[0]";
}
else
{
	print FILE_IN "(Unknown)";
}

	print FILE_IN "</os>\n";
	print FILE_IN "\t</machine>\n";
	$i++;
}

print FILE_IN "</scan>";
close(FILE_IN);
