package Webdhcpc;
# $Id: webdhcpc.pm,v 1.2 2001/04/11 20:22:43 root Exp $
# WebDHCP - Add, Delete, Modify, and Query DHCP entries via a web browser
# Copyright (C) 2001 Michael Lewis
# 
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
#

use IO::Socket;
use Crypt::CBCeasy;

#=================================================================================
#** The following Part should be edited before putting the Server in production **
#=================================================================================

# This line must be the same for the client and server
my $key = "Guigui a des gros bras, Michel est autiste";

#=================================================================================
#** Everything after this point does not have to be edited**
#=================================================================================

$| = 1;

my $begin = 'begin';
my $end = 'end';

sub new {
#===============================
# Constructor for client object
#===============================
  my ($class) = shift;
  my ($remote, $port) = @_;

  my $self = {
	'remote' => $remote || 'localhost',
	'port' => $port || '8888',
  };

  bless ($self, $class);
  return $self;
}

sub connect {
#===============================
# opens a socket to Webdhcp server.
# Its return value is the comments
# passed back from the server
#===============================

  my $self = shift;
  #my ($function, $mac, $ip, $entryname, $remote, $port) = @_;
  my ($function, %a) = @_;

  $remote = $self->{'remote'};
  $port = $self->{'port'};

  die ("Remote host is not available!") if !defined $remote;
  die ("Remote port is not available!") if !defined $port;

  $socket = IO::Socket::INET->new(PeerAddr   => $remote,
				  PeerPort  => $port)
  or return("Can't connect to $remote:$port : $@\n");

  my $qstring;
  foreach $k ( keys %a){
  	$qstring .= "$k=$a{$k},";
  	#print "GOT %a with $qstring\n";
  }
  #print "The client module got this: $qstring\n";

  $qstring =~ s/\,$//g;
  $data = "$function|$qstring";
  	#print "GOT %a with $data\n";
  $data = $self->sendformat($data);

      print $socket "$begin\n$data$end\n";

      while (defined ($line = <$socket>)) {
  	if ($line =~ /^begin/) {
  	    $in = '';
  	} elsif ($line =~ /^end/) {
  	    $pt = $self->recvformat($in);
  	    #print "RECV:\n$pt\n";
	    return ($pt);
  	    close ($socket);
	    last;
  	} else {
  	    $in .= $line;
  	}
      }
      close ($socket);
      return($pt);
}

sub sendformat {
#===============================
# Encrypts data with private key
#===============================
    my $self = shift;
    $data = shift if (@_);
    $^W = 0;
    $data = Blowfish::encipher($key, $data);
    $^W = 1;
    $data = pack "u", $data;
    return "begin\n$data\nend\n";
}

sub recvformat {
#===============================
# Dencrypts data with private key
#===============================
    my $self = shift;
    $data = shift if (@_);
    $data = unpack "u", $data;
    $^W = 0;
    $data = Blowfish::decipher($key, $data);
    $^W = 1;
    return "$data";
}

1;

__END__

=head2 NAME

Webdhcpc - Opens a socket to encrypt data to Server process

=head2 SYNOPSIS

 use lib "/location/of/script"
 use Webdhcpd;

=head2 DESCRIPTION

Here is an example use of this module:

        use Webdhcpd;

=head2 FUNCTIONS

=item new 

 Queries the database file (which is read into the object as a hash
 in memory), for either the hardware address, ip address, or the hostname

 Arguments: 1. object type (mac, ip, hn)
	     2. query string 
 Return: returns hostname string, or returns 0 for failure
 Example: lookup_host(hn,"BB477_HP5") or lookup_host(ip,"127.0.0.1")


=item connect 

 This function deletes a desired block out of the config file.

 Arguments: 1. Type (mac address, ip address, or hn -hostname)
 Return: returns returns 1 for success, or 0 for failure
 Example: delete(hn,"BB477_HP5")


=item recvformat 

 This function Decrypts the data that is recieved

 Arguments: 1. The mac address
            2. The new IP address to be assigned
 Return: returns returns 1 for success, or 0 for failure
 Example: changeip(aa:bb:cc:dd:ee:ff, 192.168.4.32)


=item sendformat 

 This function Encrypts the data before sending it

 Arguments: 1. The original mac address
            2. The new mac address
 Return: returns returns 1 for success, or 0 for failure
 Example: changemac(aa:bb:cc:dd:ee:ff, aa:bb:cc:dd:cc:cc)

=head2 AUTHORS

 Michael Lewis (mlewis@mailops.com)

=head2 CREDITS

 Thomas Akin, CISSP - helped with the encryption on the backend

=head2 SEE ALSO

 perl(1)



