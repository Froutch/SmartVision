#!/usr/bin/perl -w

use strict;
use warnings;

use Net::SSH::Expect;

my @output;
my $output;

my $login_output;
my $ssh = Net::SSH::Expect-> new (
        host => $ARGV[0],
        password => $ARGV[2],
        user => $ARGV[1],
        raw_pty => 1,
);

undef $login_output;

eval
{
	$login_output = $ssh->login(15);
};
while ($login_output eq "")
{
                sleep(2);
                $login_output = $ssh->login(15);
}

$ssh->send("whoami");

while ( defined ($output = $ssh->read_line(5)) ) {
# Send output of command to output array for printing when script is complete
                        push (@output, "$output");
                        print $output . "\n";
}
foreach (@output) {
        print $_ . "\n";
}
