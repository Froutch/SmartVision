# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)
#

BEGIN { $| = 1; print "1..1\n"; }
END { print "not ok 1\n" unless $loaded; }

use lib ".";
#use Crypt::CBCeasy || die "not ok 2: $!\n";
use Crypt::CBCeasy;
$loaded = 1;

print "ok 1\n";

######################### End of black magic.

# Insert your test code below (better if it prints "ok 13"
# (correspondingly "not ok 13") depending on the success of chunk 13
# of the test code):

print "2..2\n";
my $key = "Compile TEST";
my $cdata = "Encryption and Decription Works! Good.";
my $data = $cdata;

$^W = 0;
$data = Blowfish::encipher($key, $data);
$^W = 1;
$data = pack "u", $data;

$^W = 0;
$new_data = unpack "u", $data;
$new_data = Blowfish::decipher($key, $new_data);
$^W = 1;

if ($new_data eq $cdata){
    print "ok 2\n";
    print "$new_data\n";
}else{
    print "not ok 2\n";
    print "$new_data\n";
}

print "3..3\n";

if (! -x "/usr/sbin/dhcpd" or ! -x "/usr/local/sbin/dhcpd") {

   print "not ok 3\n";

print <<ERROR;

   	Cannot find dhcpd in /usr/sbin or /usr/local/sbin! If dhcpd
	is found in a different directory, then create a symlink
	to one of these directories. If this is not the machine 
	with the DHCP server, then you could ignore this message :)

ERROR
   exit(1);
}else{
   print "Found dhcpd!\n";
   print "ok 3\n";
}
exit(0);
