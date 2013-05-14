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

my $timeout = 1;

# use the format as per below to add new ports
# perl is not going to be as fast a nmap, this is
# a specialized tool to check for RDP and SSH
# and print it out to a spreadsheet, use nmap!

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
#	print $arp_scan_ip[$i];
#	print "\t";
#	print $arp_scan_mac[$i];
#	print "\t";
#	print $arp_scan_const[$i];
#	print "\n";
	$i++;
}

foreach $j (@arp_scan_ip)
{
	my $host = $j;

    # strip off the new line character
    chomp($host);

    # get a hash ref (I think that's the data structure returned)
    my $host_hr = check_ports($host,$timeout,\%port_hash);

    # print whatever host this
    print "$host";

    # loop over each key in the hash that matches $proto (tcp), so 22 and 3389
    for my $port (keys %{$host_hr->{$proto}}) {

        # if it's open, say "yes", else say "no"
        my $yesno = $host_hr->{$proto}{$port}{open} ? "yes" : "no";

                # if it's "yes", then print it out
		if ($yesno eq 'yes') {
			print "\t$port";
		}
    }

    # add a new line for formatting
    print "\n";
}
