package Webdhcp_Server;
# $Id: webdhcpd.pm,v 1.7 2001/04/27 14:49:34 root Exp root $
# 
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

$VERSION = '1.31';

#use strict;
$ENV{PATH} = "/sbin:/bin:/usr/sbin:/usr/bin";
$ENV{IFS} = '';
$ENV{'SHELL'} = '/bin/sh';

use File::Copy;
use Fcntl ':flock';
use Shell qw(cp grep);
 
#===================================================================================
#** The following Part should be reviewed before putting the Server in production **
#===================================================================================

# Debug level is either 0 for 'none' or 1 for 'verbose'
my $debug = 0;

my $domain = '192.168';
my $backupdir = "/etc/dhcp-backup";
my $dhcpdir = "/etc";
my $lease_file = "/etc/dhcpd.leases";
my $pidfile = "/etc/dhcpd.pid";
my $dhcpserver = "/usr/local/sbin/dhcpd";

#===================================================================================
#** Nothing should be modified from this point 
#===================================================================================

# Define Gobal Variables for 'use strict'
use vars qw(%subnet %hosts @other);

my $flimit = 5;  # Limit of the number archived files in the backup directory

my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);

$mon = $mon + 1;
$year = $year + 1900;
$year = substr ($year, 2, 2);

if ($mday !~ /\d{2}$/) {
	$mday =~ s/(.)/0$1/;
}
my $date = "$mon-$mday-$year";

my $error_msg = undef;

#==========================================================================
# New webdhcpd object 
#-------------------------------------------------------------------------
# Arguments: 1. dhcpd.conf filename (optional)
# Returns:   New object reference
#==========================================================================

sub new
{
  my ($class, $conf_file) = @_;

  my $r = {
    "config_file" => $conf_file,           # name of dhcpd.conf file
    "lease_file" => $lease_file,          # name of dhcpd.leases file
    "hosts" => undef,  	                   # hash containting hosts
    "lease" => undef  	                   # hash containing leases
  };

  $r->{config_file} = '/etc/dhcpd.conf' if (! defined $r->{config_file});

  bless $r, $class;

  if( $r->read_conf() == 0) { return undef; }
  return $r;

  print "Returning the new object...\n" if $debug;
}

#==========================================================================
# Reads dhcpd.conf file into a hash. 
#-------------------------------------------------------------------------
# Arguments: 1. none
# Returns:   1 for success, 0 for failure
#==========================================================================

sub read_conf
{
  my ($self) = @_;
  my (@cl, $hn);

  open(CONFIG,  "$self->{config_file}") || die "Cannot open config file: $!";
  $self->{hosts} = undef;

  LINE: while(<CONFIG>) {
    @cl = split;

    #--- host scope ---
    if(defined $cl[0]) {
     $cl[0] =~ s/^\s(.*)/$1/g;
      if($cl[0] =~ /^host/) {
      $hn = $cl[1];

      while(<CONFIG>) {
        @cl = split;
        next LINE if($cl[0] eq "}");  # end of "config { }" scope

        #--- ethernet address ---

        if($cl[0] eq "hardware" && $cl[1] eq "ethernet") {
          chop($cl[2]);
          $self->{hosts}{$hn}{mac} = $cl[2];
        }

	#--- ip address ---

        if($cl[0] eq "fixed-address") {
          chop($cl[1]);
          $self->{hosts}{$hn}{ip} = $cl[1];
	}

        #--- client host name ---

        if($cl[0] eq "option" && $cl[1] eq "host-name") {
          $cl[2] =~ s/\"//g;
          $cl[2] =~ s/\;//;
          $self->{hosts}{$hn}{hn} = $cl[2];
        }

      } ## end while
    } ## end if (host)
   } ## end if (defined)
  } ## end while
  return 1;
}

sub lookup_host {
#=========================================================================
# Queries the database file (which is read into the object as a hash
# in memory), for either the hardware address, ip address, or the hostname
#-------------------------------------------------------------------------
# Arguments: 1. object type (mac, ip, hn)
#	     2. query string 
# Return: returns hostname string, or returns 0 for failure
# Example: lookup_host(hn,"BB477_HP5") or lookup_host(ip,"127.0.0.1")
#
#=========================================================================
  my (@types, $host, $abbr, $found, $t, $m);
  my ($self, $type, $qstring) = @_;
  print "Entering the Search Function\n";
  $self->read_conf;
  $found = 0;
  #print "Looking for $qstring in database\n" if $debug;
  @types = ('mac', 'ip', 'hn');
  return 0 if (! grep {/$type/} @types);

  my $h = $self->{hosts};
  print "Entering while loop, evaluating database\n" if $debug;

  while (($host, $abbr) = each(%$h)){
	$t = $h->{$host}{$type};

  	if (defined $t && $t =~ /$qstring/){
		$found = 1;
		last;
	}
  }
 if ($found == 1) {
	print "Found $host";
	if ($debug) {
		print ", now returning it to calling function\n" if $debug;
	}else{
		print "\n";
	}
	return ($host);
 }else{
 	return (0);
 }
}

sub delete {
#=========================================================================
# This function deletes a desired block out of the config file.
#-------------------------------------------------------------------------
# Arguments: 1. Type (mac address, ip address, or hn -hostname)
# Return: returns returns 1 for success, or 0 for failure
# Example: delete(hn,"BB477_HP5")
#=========================================================================
  my ($self, $type, $qstring) = @_;
  my (@types, $hn);

  @types = ('mac', 'ip', 'hn');

  if (! grep {/$type/} @types) {
	error("Incompatible Type, $type is not recognized!");
	return 0;
  }

  $self->read_conf;
  print "Passing in $qstring\n" if $debug;
  $hn = $self->lookup_host($type, $qstring);

  print "DELETING $qstring\n" if $debug;
  #if ($hn =~ /\d.*/ and $hn == 0){ 
  if ($hn eq '0'){ 
  	print "ERROR with $qstring\n" if $debug;
	$self->error("$type address was not found!");
	return 0;
  }
  print "NO ERROR with $qstring\n" if $debug;

  print "This is hn: $hn\n" if $debug;
  print "Entering search routine\n" if $debug;
  my (@hblock) = $self->getblock(0,$hn);
  #my (@remaining) = $self->getblock(1,$hn);
  my $mac = $self->{'hosts'}{$hn}{'mac'};
  my (@remaining) = $self->getblock(1,$hn);

  #-----This next line is used to remove the comment field
  @remaining = grep {!/##.*Host\ $hn/} @remaining;
  #@remaining = grep {!/#\=.*$mac/} @remaining;

  print "Here is the block to delete:\n @hblock" if $debug;

  #&lockfile($self->{config_file}); flock?
	print "THIS is the DELETE function\n";
  my $bfile = $self->archive($self->{config_file});
  print "backup file is: $bfile\n" if $debug;
  
  my $cfile = "$self->{config_file}";
  print "config file is $cfile\n" if $debug;

  #copy("$cfile", "$backupdir/$bfile") || die "$!";
  system 'cp', '-f', "$cfile", "$backupdir/$bfile";
  system 'gzip', '-f', "$backupdir/$bfile";
  
  open (NCFG,"> $cfile") || die "$!";
  print NCFG @remaining;
  close (NCFG);
  
  #unlink ("$backupdir/$backupfile.$$");
  print "The delete function has this MAC Address: $mac\n" if $debug;
  #my $s = $self->del_lease($mac);
  $self->del_lease($mac);
  restart();
  
  return 1;
}

sub changeip {
#=========================================================================
# This function changes the IP address of a particular device. It can be
# used a function to move a device to a new subnet.
#-------------------------------------------------------------------------
# Arguments: 1. The mac address
#            2. The new IP address to be assigned
# Return: returns returns 1 for success, or 0 for failure
# Example: changeip(aa:bb:cc:dd:ee:ff, 192.168.4.32)
#=========================================================================

    my ($self, $mac, $newip) = @_;
    my (@newblock, $found, $line, $oldip);
    $self->read_conf;
    $found = 0;

    my $h = $self->lookup_host('ip', $newip);
    my $om = $self->lookup_host('mac', $mac);

    if ($om eq 0){
    	$self->error("MAC Address $oldmac was not found in database!");
	return 0;
    }

    if ($h ne '0'){
	$self->error("The IP Address $newip is already in use!\n");
	return 0;
    }

    $oldip = $self->{'hosts'}{$om}{'ip'};

    if ($newip eq $oldip){
	$self->error("The new IP Address $newip Cannot be the same as the old IP!\n");
	return 0;
    }

    print "Looking for $mac in database ...\n" if ($debug);

    open(CFG, $self->{config_file}) || error("Cannot open $self->{config_file} file: $!");
    while ($line = <CFG>){
	flock(CFG, LOCK_SH);
    	#if ($line =~ /$oldip/ && $line =~ /fixed-address/){
    	if (!$found && $line =~ /fixed-address $oldip/){
		$line =~ s/$oldip/$newip/g;
		$found = 1;
  		push(@newblock,"\t## $oldip changed to $newip by web script on $date\n");
  		push(@newblock,$line);
		next;
  	}
  		push(@newblock,$line);
    }
	flock(CFG, LOCK_UN);
    close (CFG);

  my $bfile = $self->archive($self->{config_file});
  cp('-f', "$self->{config_file}", "$backupdir/$bfile");
  system 'gzip', '-f', "$backupdir/$bfile";
  
  open (NCFG,"> $self->{config_file}") || die "Cannot open config file for writting: $!";
  	print NCFG @newblock;
  close (NCFG);

  if ($found != 1) {
	return 0;
  } else {
  	$self->sort_conf;
	restart();
  	return 1;
  }
}

sub changemac {
#=========================================================================
# This function changes the mac address of a particular device. 
#-------------------------------------------------------------------------
# Arguments: 1. The original mac address
#            2. The new mac address
# Return: returns returns 1 for success, or 0 for failure
# Example: changemac(aa:bb:cc:dd:ee:ff, aa:bb:cc:dd:cc:cc)
#=========================================================================
    my ($self, $oldmac, $newmac) = @_;
    my (@newblock, $found, $line);
    $self->read_conf;
    $found = 0;

    my $h = $self->lookup_host('mac', $newmac);
    my $om = $self->lookup_host('mac', $oldmac);

    if ($om eq 0){
    	$self->error("MAC address $oldmac was not found in database!");
	return 0;
    }

    if ($oldmac eq $newmac){
	$self->error("The old mac address $newmac cannot be the same as the new mac address $newmac!\n");
	return 0;
    }

    #if ($h != 0){
    #if ($h !~ /\d/){
    if ($h ne '0'){
	$self->error("The mac address $newmac is already in use!\n");
	return 0;
    }

    print "Looking for $oldmac...\n" if ($debug);
    #open(CFG, $self->{config_file}) || die "Cannot open $self->{config_file} file: $!";
    open(CFG, $self->{config_file}) || error("Cannot open $self->{config_file} file: $!");
    while ($line = <CFG>){
	flock(CFG, LOCK_SH);
    	#if ($line =~ /$oldmac/ && $line =~ /ethernet/){
    	if (!$found && $line =~ /ethernet $oldmac/){
		$line =~ s/$oldmac/$newmac/g;
		$found = 1;
  		push(@newblock,"\t## $oldmac changed to $newmac by web script on $date\n");
  		push(@newblock,$line);
		next;
  	}
  		push(@newblock,$line);
    }
	flock(CFG, LOCK_UN);
    close (CFG);

  my $bfile = $self->archive($self->{config_file});
  #copy("$self->{config_file}", "$backupdir/$bfile");
  #system 'cp', '-f', "$self->{config_file}", "$backupdir/$bfile";
  cp('-f', "$self->{config_file}", "$backupdir/$bfile");
  system 'gzip', '-f', "$backupdir/$bfile";
  
  open (NCFG,"> $self->{config_file}") || die "Cannot open config file for writting: $!";
  	print NCFG @newblock;
  close (NCFG);

  if ($found != 1) {
	return 0;
  } else {
	restart();
  	return 1;
  }
}

sub getblock {
#=========================================================================
# This function returns the desired block found from the config file in 
# the form of an array. An argument of 0 or 1 is required. If an argument of 1
# is passed, then an array is returned containing all *but* the passed hostname. 
#-------------------------------------------------------------------------
# Arguments: 1. 0 - returns an array of desired block (*default*)
#		1 - returns an array of all but desired block
#	     2. The hostname 
# Return: returns an array based on the passed value, or returns 0 for failure
# Example: changemac(0, BB477_HP5)
#=========================================================================
    my ($self, $w, $hn) = @_;
    my ($fline, @allother, @hb, @l, $line);
    $self->read_conf;

    #open(CFG, $self->{config_file}) || die "Cannot open $self->{config_file} file: $!";
    open(CFG, $self->{config_file}) || error("Cannot open $self->{config_file} file: $!");
    BEGINFILE: while ($line = <CFG>){
          #if ($line !~ /host\s$hn.\{/i){
          if ($line !~ /host\s$hn/i){
  		push(@allother,$line);
  	  }else{
  	    print "Getblock function found $hn\n" if $debug;
  	    push(@hb,$line);
  	    while ($fline = <CFG>){
  	      if ($fline =~ /}/){
  	 	push(@hb,$fline);
  		next BEGINFILE;
  	      }
  	      push(@hb,$fline);
  	    }
  	  }
    }
    close (CFG);
  return (@hb) if ($w == 0);
  return (@allother) if ($w == 1);
  return 0 if ($w !~ /[0|1]/);
}

sub get_lease_block {
#=========================================================================
# This function returns the desired block found from the leases file in 
# the form of an array. An argument of 0 or 1 is required. If an argument of 1
# is passed, then an array is returned containing all *but* the passed hostname. 
#-------------------------------------------------------------------------
# Arguments: 1. ip, mac, or hn 
#	     2. The query string
# Return: returns an array of desired block from the lease file
# Example: get_lease_block(ip, 192.168.2.5)
#=========================================================================
    my ($self, $qtype, $qstring) = @_;
    my ($fline, @allother, @hb, @l, $line, $h, $hn) = undef;
    my ($mac_search, $ip_search, $hn_search) = 0; # IP search is quick
	print "get_lease_block function is searching for $qstring in lease file\n" if $debug;

    if ($qtype =~ 'mac'){
	$mac_search = 1;
    }elsif ($qtype =~ 'ip'){
	$ip_search = 1;
    }elsif ($qtype =~ 'hn'){
	$hn_search = 1;
    }else{
	error("$mac is an invalid option to this function!");
    }

    open(LEASE, $self->{lease_file}) || error("Cannot open $self->{lease_file} file: $!");
    print "Get_lease_block is opening lease file for $qtype of $qstring\n" if $debug;
    my $line_number = 0; # line number

    BEGIN_LEASE_FILE: while ($line = <LEASE>){
	  my (@tb, $found_mac, $found_hn);
	  $line_number++;

	  @tb = '';
	  $found_mac = 0; # Temporary HN holder
	  $found_hn = 0; # Temporary HN holder

	  ##--------------
	  # Looking for IP
	  ##--------------
	  if ($ip_search and $line =~ /^lease\s$qstring/i){
		push(@hb,$line);
		while ($fline = <LEASE>){
			if ($fline =~ /}/){
				push(@hb, $fline);
				next BEGIN_LEASE_FILE;
			}
			push(@hb, $fline);
		}
	  }

	  ##---------------
	  # Looking for MAC
	  ##---------------
          if ($mac_search and $line =~ /^lease\s/i){

  	    push(@tb,$line);

  	    while ($fline = <LEASE>){
		$line_number++;

		if (!$found_mac and $fline !~ /hardware\s(ethernet|token-ring)/){
			push(@tb,$fline);	
			next;
		}elsif (!$found_mac and $fline !~ /hardware\s(ethernet|token-ring)\s$qstring/){
			@tb = undef;
			next BEGIN_LEASE_FILE;
		}elsif (!$found_mac and $fline =~ /hardware\s(ethernet|token-ring)\s$qstring/){
			$found_mac = 1;
			push(@tb, $fline);
  	    		print "Get_lease_block function found $qstring at line number $line_number\n" if $debug;
			next;
		}

  	      if ($fline =~ /}/){
			if ($found_mac){
  	 			push(@hb,@tb);
  	 			push(@hb,$fline);
			}
  		next BEGIN_LEASE_FILE;
  	      }
  	      push(@tb,$fline);
  	    }
	  }

	  ##---------------------
	  # Looking for Host Name
	  ##---------------------
          if ($hn_search and $line =~ /^lease\s/i){

  	    push(@tb,$line);

  	    while ($fline = <LEASE>){
		$line_number++;

  		if ($fline =~ /}/){
  			if ($found_hn){
  	 			push(@hb,@tb);
  	 			push(@hb,$fline);
			}
			$found_hn = 0;
  			next BEGIN_LEASE_FILE;
		}

		if (!$found_hn and $fline !~ /client\-hostname/){
			push(@tb,$fline);	
			next;
		}elsif (!$found_hn and $fline !~ /$qstring/i){
			@tb = undef;
			next BEGIN_LEASE_FILE;
		}elsif (!$found_hn and $fline =~ /$qstring/i){
			$found_hn = 1;
			push(@tb, $fline);
  	    		print "Get_lease_block function found $qstring at line number $line_number\n" if $debug;
			next;
		}

  	      	push(@tb,$fline);
  	    }
	  }
    }
    close (LEASE);
  #print "Here is \@hb:\n"."@hb"."\n";
  return (@hb);
}

sub del_lease {
#=========================================================================
# This function deletes the desired entry out of the leases file.
#-------------------------------------------------------------------------
# Arguments: 1. The mac address
# Return: Returns an array based on the passed value, or returns 0 for failure
# Example: del_lease(0, BB477_HP5)
#=========================================================================
    my ($self, $mac) = @_;
    my ($found, $line, $f, $fline, @allother, @delblock, @hb);

    if (!defined $mac){
	error("MAC Address was not provided to the del_lease function!");
	return 0;
    }

    $found = 0;
    my $g = "grep -ci $mac $self->{lease_file}";
    $g =~ /(.*)/;
    $g = $1;
    $f = `$g`;
    chomp($f);

    print "The del_lease function got MAC address -$mac-\n" if $debug;
    print "Grep from leases for $mac returned $f\n" if $debug;

   if ($f > 0){
    open(LEASE, "$self->{lease_file}") || error("Cannot open $self->{lease_file} file: $!");
    open(LEASE_W, "> $self->{lease_file}.$$") || error("Cannot open $self->{lease_file}.$$ file: $!");
    BEGINFILE: while ($line = <LEASE>){
  	push(@hb,$line);
  	while ($fline = <LEASE>){
  	    if ($fline =~ /}/){
  	    	push(@hb,$fline);
		if ($found) {
			$found = 0;
			print "This is the Delete Block:\n @hb\n" if $debug;
			undef(@hb);
		} else {
			print LEASE_W @hb;
			undef(@hb);
		}
  		next BEGINFILE;
  	    } else {
          	if ($fline =~ /$mac/i){
    			print "Found MAC address -$mac-, in lease file\n" if $debug;
			$found = 1;
  	  	}
  	   	push(@hb,$fline);
    	   }
	}
      }
    close (LEASE);
    close (LEASE_W);
    
   print "THIS is the DEL_LEASE function\n" if $debug;
   print "passing $self->{lease_file} into archive function\n" if $debug;

   my $lfile = $self->archive($self->{lease_file});
   #copy("$self->{lease_file}", "$backupdir/$lfile");
   system 'cp', '-f', "$self->{lease_file}", "$backupdir/$lfile";

   print "Moving new lease file: $self->{lease_file}.$$ into old lease file: $self->{lease_file}\n" if $debug;

   system 'mv', "$self->{lease_file}.$$", "$self->{lease_file}";
   system 'gzip', '-f', "$backupdir/$lfile";

  }else{
	print "$mac is not found in leases file\n" if $debug;
  }

  return;
}

sub add {
#=========================================================================
# This function adds a block to the config file based on parameters.
#-------------------------------------------------------------------------
# Arguments: 1. Hostname (Required)
#            2. Mac Address (Required)
#	     3. IP Address (Required)
# Return: Returns 1 for success, and 0 for failure
# Example: add(BB477_HP5, aa:aa:aa:ff:ff:ff, 192.168.23.43)
#=========================================================================
  my ($self, $hn, $mac, $ip) = @_ if (defined @_);
  my ($lhn, $lmac, $lip);
  $self->read_conf;

  print "Entering the ADD function\n";
  
  if (! defined $hn && ! defined $mac && ! defined $ip){
	error("Not enough arguments in the add function\! Missing data.");
	return 0;
  }
  
  $lhn = $self->lookup_host('hn',$hn);
  $lmac = $self->lookup_host('mac',$mac);
  $lip = $self->lookup_host('ip',$ip);
  
  print "$lhn, $lmac, $lip\n" if $debug;
  
  ## Unusual situation, the test failed if I tested a string with != instead
  ## of ne. Therefore, I simply tested to see if it is not a digit (need a fix)

  #if ( $lhn !~ /\d/ || $lmac =~ /\d/ || $lip =~ /\d/ ){
  if ( $lhn ne '0' || $lmac ne '0' || $lip ne '0' ){
  	print "ERROR!: hn $lhn, mac $lmac, ip $lip\n" if $debug;
  	$self->error("Hostname is already in use") if ( $lhn ne '0');
  	$self->error("Mac address is already in use") if ( $lmac ne '0');
  	$self->error("IP address is already in use") if ( $lip ne '0');
  	return 0;
  }

  if (!$self->has_subnet($ip)){
	$self->error("The subnet for $ip is not setup in DHCP. Please contact the administrator if this is a problem.");
	return 0;
  }
  
  my $bfile = $self->archive($self->{config_file});
  cp('-f', "$self->{config_file}", "$backupdir/$bfile");
  system 'gzip', '-f', "$backupdir/$bfile";
  
  open (NCFG,">> $self->{config_file}") || die "Cannot open config file for writting: $!";
  flock(NCFG, LOCK_EX);
  print NCFG "host $hn {\n";
  print NCFG "\t## Host $hn wih mac of $mac added by web on $date\n";
  print NCFG "\thardware ethernet $mac;\n";
  print NCFG "\tfixed-address $ip;\n";
  print NCFG "\toption host-name \"$hn\"\;\n";
  print NCFG "}\n";
  flock(NCFG, LOCK_UN);
  close (NCFG);

  $self->read_conf;	## These 2 lines are a hack so that the lease file can be updated
  $lhn = $self->lookup_host('hn',$hn);

  $self->sort_conf;	## Sort the conf file

  print "This is the MAC Address recieved by the Add function: $self->{'hosts'}{$lhn}{mac}\n" if $debug;
  $self->del_lease($self->{'hosts'}{$lhn}{mac});

  restart();
  
  return 1;
}

sub has_subnet {
#=========================================================================
# Checks to see if the supplied IP Address is associated with a subnet
# entry in the configuration file. In other words, there is no need to
# add/delete an entry from the configuration file if a subnet block
# does not exist
#-------------------------------------------------------------------------
# Arguments: 1. The mac address
# Return: Returns 1 for success and 0 for failure
# Example: has_subnet(192.168.2.3)
#=========================================================================
	my ($self, $ip) = @_;

	if (!defined $ip or $ip eq '0'){
		error("SUBNET not found for $ip");
		return 0;
	}

  	my $cfile = "$self->{config_file}";

	print "Searching based for $ip\n";
	my @mip = split (/\./, $ip);
	my $net = $mip[2];
	my $ss = "grep -nwc \'$domain.$net\\.0\' $cfile\n";
	$ss =~ m/(.*)/;
	my $sss = $1;
	my $s = `$sss`;
	chomp $s;
	print "Has_subnet returned a value of $s for \$s and $net for the network\n" if $debug;
	return($s);

}

sub sort_conf {
#=========================================================================
# Sorts the configuration file in numerical order
#-------------------------------------------------------------------------
# Arguments: None
# Return: Returns 1 for success and 0 for failure
# Example: sort_conf()
#=========================================================================
	my $self = shift;
	print "Reading Config file for Sorting\n";
	$self->read_subnets_into_hash;
	$self->read_hosts_into_hash;
	$self->print_sorted;
	return(1);
}

sub read_subnets_into_hash {
#=========================================================================
# Use an existing hash with the keys being the subnet and the
# value being an array of the entire subnet entry (local scope)
# after which, the hash keys will be numerically sorted.
#-------------------------------------------------------------------------
# Arguments: None
# Return: Void Function
# Example: read_subnets_into_hash()
#=========================================================================

	my $self = shift;
	my ($sline);
  	my $cfile = "$self->{config_file}";
        open(CONF,"<$cfile") || die "Cannot open config file: $!";
        ENTRY: while ($line = <CONF>){
                next if ($line =~ /^\s*#/);
                my (@s, $nline);
                if ($line =~ /subnet\s(.*)\snetmask.*\{/) {
                        $net = $1;
                        #print "Subnet line: $line\n";
                        $sline .= $line;
                        while ($nline = <CONF>) {
                                if ($nline =~ /^\s*\}/){
                        		$sline .= $nline;
                                        #@{ $subnet{$net} } = @s;
                                        $subnet{$net} = $sline;
                                        #print "Pushing @s";
                                        #undef @s;
                                        undef $sline;
                                        next ENTRY;
                                }
                        	$sline .= $nline;
                        }
                }
        }
        close (CONF);
}

sub read_hosts_into_hash {
#=========================================================================
# Use an existing hash with the keys being the host and the
# value being an array of the entire host entry (local scope)
# after which, the hash keys will be numerically sorted.
#-------------------------------------------------------------------------
# Arguments: None
# Return: Void Function
# Example: read_hosts_into_hash()
#=========================================================================
	my $self = shift;
	my ($rline);
  	my $cfile = "$self->{config_file}";
        open(CONF,"<$cfile") || die "Cannot open config file: $!";
        ENTRY: while ($line = <CONF>){
                my @h;
                next if ($line =~ /^\s*#/);
                if ($line =~ /host\s.*\{/) {
                        #print "IP line: $line\n";
			$rline .= $line;
                        while ($nline = <CONF>) {
                                if ($nline =~ /^\s*\}/){
                                        $nline =~ s/^\s//g;
					$rline .= $nline;
                                        #push (@h, $rline);
                                        #@{ $hosts{$ip} } = @h;
					$hosts{$ip} = $rline;
                                        #print "Pushing @h";
                                        #undef @h;
					undef $rline;
                                        next ENTRY;
                                }
                                if ($nline =~ /fixed\-address\s(.*)\;/){
                                        #print "This is nline: $nline\n";
                                        $ip = $1;
                                        #print "This is ip: $ip\n";
                                }
                                #$rline .= $nline if ($nline !~ /^\s*#/);
				$rline .= $nline;
                        }
                }
        }
        close (CONF);
}

sub read_other {
#=========================================================================
# Use an existing hash with the keys being all other entries
# the hash keys will be numerically sorted.
#-------------------------------------------------------------------------
# Arguments: None
# Return: Void Function
# Example: read_other()
#=========================================================================

	my $self = shift;
	my($rline, @o);
  	my $cfile = "$self->{config_file}";
        open(CONF,"<$cfile") || die "Cannot open config file: $!";
        while ($line = <CONF>){
                #print "$line";
                next if ($line =~ /^\s*#/);
                next if ($line =~ /^$/);
                last if ($line =~ /host\s.*\{/ or $line =~ /subnet\s.*\{/ or $line =~ /^#\*\*\*/);
		$rline .= $line;
        }
        close (CONF);

	return $rline;
        #push (@o, $rline);

#	if (defined @o){
#        	return (@o);
#	}else{
#		return (0);
#	}
}

sub byip {
#=========================================================================
# Sort function which compares IPv4 addresses
#-------------------------------------------------------------------------
# Arguments: Two IP Addresses
# Return: Returns the numerically smaller number
# Example: byip('192.168.100.5','192.168.56.3')
#=========================================================================
        @aa = split(/\./, $a);
        @bb = split(/\./, $b);
        #print "Checking $aa[3] against $bb[3]\n";
        return (($aa[2] <=> $bb[2]) or ($aa[3] <=> $bb[3]));
}

sub print_sorted {
#=========================================================================
# As the name suggests, this function prints the sorted DHCP Configuration
# file.
#-------------------------------------------------------------------------
# Arguments: None
# Return: Void Function
# Example: print_sorted()
#=========================================================================

	my $self = shift;
  	my $cfile = "$self->{config_file}";

        foreach $key (keys %hosts){
                #print "These are the keys: $key\n";
                push (@hostarray, $key);
        }
        
        foreach $skey (keys %subnet){
                #print "These are the nets: $skey\n";
                push (@netarray, $skey);
        }
        
        @harray = sort byip @hostarray;
        @narray = sort byip @netarray;

        my $otherstuff = $self->read_other;
        
        open(NCONF,">$cfile") || die "cannot open $cfile!";
        
        print NCONF "# SORTED #\n";
        print NCONF "$otherstuff";

        foreach $i (@narray) {
                @n = split (/\./, $i);
                print NCONF "\n";
                print NCONF '#', '*' x 30, "#\n";
                printf NCONF ("#\t%s\n", "$n[2]\.$n[3]");
                print NCONF '#', '*' x 30, "#\n";
                #print NCONF '#', '-' x 30, "\n";
                #print NCONF "@{ $subnet{$i} }";
                print NCONF "$subnet{$i}";
                #print "$i\n";
                print NCONF '#', '-' x 30, "\n";
                foreach $j (@harray) {
                        $n[2] =~ s/\s//g;
                        if ($j =~ /$n[0]\.$n[1]\.$n[2]\./){
                                #print "Checking $j\n";
                                #print NCONF "@{$hosts{$j}}";
                                print NCONF "$hosts{$j}";
                        }
                }
        }
        close (NCONF);
}

sub print {
#=========================================================================
# This function simply prints out all records in the config file, it is
# currently not used.
#-------------------------------------------------------------------------
# Arguments: None
# Return: Void Function, prints all entries in DHCP configuration file
# Example: print()
#=========================================================================
  my ($key, $value, $tkey, $tvalue);
  my ($self) = @_;
  $self->read_conf;
  my $h = $self->{hosts};
  while (($key, $value) = each(%$h)){
  	while (($tkey, $tvalue) = each(%$value)){
		print "$key $tvalue\n";
	}
  }
 return;
}

sub debug {
#=========================================================================
# This function is used to activate debuging
#-------------------------------------------------------------------------
# Arguments: 1. "0" for off, "1" for on
# Return: Returns the value of $debug
# Example: debug()
#=========================================================================

  my ($self, $w) = @_;
  
  if (defined $w and $w !~ /0|1/) {
  	error("There are only two valid arguments, 0 for debug off and 1 for debug on");
  	return 0;
  }
  
  #$self->$debug = $w;
  $debug = $_[1];
  print "DEBUG is set to $debug\n" if $debug;
  return($debug);
}

sub error {
#=========================================================================
# This function simply prints out any error message sent to it
#-------------------------------------------------------------------------
# Arguments: 1. The message is supplied
# Return: Returns 0 for success 
# Example: error()
#=========================================================================
  my ($self, $response) = @_;
  $error_msg .= "ERROR: ";
  $error_msg .= "$response\n" if (defined $response);
  $error_msg .= "\n" if (!defined $response);
  return 0;
}

sub read_error {
#=========================================================================
# This function simply returns the string in the error buffer
#-------------------------------------------------------------------------
# Arguments: None
# Return: Returns error string
# Example: read_error()
#=========================================================================
  my ($self) = @_;
  return ($error_msg);
}

sub restart {
#=========================================================================
# This function restarts the DHCPD process
#-------------------------------------------------------------------------
# Arguments: None
# Return: null
# Example: restart()
#=========================================================================
  my ($self) = @_;
  my $cpid;
  print "Restarting DHCPD server... ";
  
  open(PID,"$pidfile");
  flock(PID, LOCK_SH);
  my $pid = <PID>;
  flock(PID, LOCK_UN);
  close(PID);

  print "the previous PID was $pid\n";
  $pid =~ /(.*)/;
  #kill('INT', $1);
  kill(9, $1) || error("$!");
  system "$dhcpserver", '-p', '67';

  # STOP & START the deamon script
  #system '/etc/init.d/dhcp','stop';
  #system '/etc/init.d/dhcp','start';

#  open (AT,"|at now \+ 1 minute") || die "Cannot start job!: $!\n";
#  print AT 'pkill -x dhcpd;/usr/local/sbin/dhcpd';
#  close (AT);

  return;
}

sub archive{
#=========================================================================
# This function archives changes made the the DHCP configuration and 
# lease files.
#-------------------------------------------------------------------------
# Arguments: File to archive
# Return: Returns a string representing the archived filename
# Example: archive()
#=========================================================================

  my($self, $file) = @_;
  my($ext, $bfile, @dirlist, @biglist);
  
	print "This is the file to archive before: $file\n" if $debug;
  if ($file =~ /^\//) {
	$file =~ s/^\/.*\///g;
  }
	print "This is the file to archive after: $file\n" if $debug;

  chdir "$backupdir";
  print "Entering the archiver function\n" if $debug;
  
  opendir(DIR,"$backupdir") || die "Cannot open $backupdir: @!";
    print "Opening the backup directory: $backupdir\n" if $debug;
    $bfile = "$file.$date";
	print "Archive is searching for this pattern: $bfile\n" if $debug;
    @dirlist = grep { /$bfile/ } readdir (DIR);
    @biglist = grep { /$file/ } readdir (DIR);
  closedir DIR;

  while ($#biglist > $flimit){
	#system 'rm', '-f', "$biglist[$#biglist]";
	unlink("$biglist[$#biglist]");
  	print "Removing $biglist[$#biglist], because there are $#biglist files in archive\n" if $debug;
	#system 'mv', "$biglist[$#biglist]", '/tmp';
  }
  
  print "filtered list -@dirlist-\n" if $debug;
  
  $ext = ($#dirlist + 2); ## Indexing starts at 0
  print "Returning $bfile.$ext\n" if $debug;
  return ("$bfile.$ext");
}

#=========================================================================
# This concludes the main Perl Module. The remaining material is for 
# documentation purposes only.
#=========================================================================

1;

__END__

=head2 NAME

Webdhcp - Add, Delete, Modify and Sort DHCP database

=head2 SYNOPSIS

	use lib "/location/of/script"
	use Webdhcp_Server;
	$object = new Webdhcp_Server;
	$object->changeip("AA:BB:CC:00:DD:FF", "10.0.3.1");
	$object->changemac("AA:BB:CC:00:DD:FF", "AA:BB:CC:00:D7:55");
	$object->add("HP5-PAYROLL","00:08:AD:CB:DE:F6", "10.2.5.10");

=head2 DESCRIPTION

 Webdhcpd is an application that uses encryption, logging, and documentation 
 to add, delete, and modify entries in the DHCP config file. Please note that 
 this program assumes that you are using ISC DHCPD Version 2.0pl5 or ealier. 
 Unfortunately, the program also assumes that you have some form of clear text 
 documentation on the web server that has a list of all reserved IP addresses. 
 I have included an example in this distribution. I will provide a simple script 
 that will generate this documentation from your "dhcpd.conf" file in the future. 
 You should be able to query the dhcpd.conf and dhcpd.leases files from the web 
 without the documentation files, however, you should consider modifying the 
 script to meet your environment.

=head2 FUNCTIONS

=over 4

=item lookup_host 

 Queries the database file (which is read into the object as a hash
 in memory), for either the hardware address, ip address, or the hostname

 Arguments: 1. object type (mac, ip, hn)
	    2. query string 
 Return: returns hostname string, or returns 0 for failure
 Example: lookup_host(hn,"BB477_HP5") or lookup_host(ip,"127.0.0.1")


=item delete 

 This function deletes a desired block out of the config file.

 Arguments: 1. Type (mac address, ip address, or hn -hostname)
 Return: returns returns 1 for success, or 0 for failure
 Example: delete(hn,"BB477_HP5")


=item changeip 

 This function changes the IP address of a particular device. It can be
 used a function to move a device to a new subnet.

 Arguments: 1. The mac address
            2. The new IP address to be assigned
 Return: returns returns 1 for success, or 0 for failure
 Example: changeip(aa:bb:cc:dd:ee:ff, 192.168.4.32)


=item changemac 

 This function changes the mac address of a particular device. 

 Arguments: 1. The original mac address
            2. The new mac address
 Return: returns returns 1 for success, or 0 for failure
 Example: changemac(aa:bb:cc:dd:ee:ff, aa:bb:cc:dd:cc:cc)


=item getblock 

 This function returns the desired block of data from the config file in 
 the form of an array. An argument of 0 or 1 is required. If an argument of 1
 is passed, then an array is returned containing all *but* the passed hostname. 

 Arguments: 1.	0 - returns an array of desired block (*default*)
		1 - returns an array of all but desired block
	    2. The hostname 
 Return: returns an array based on the passed value, or returns 0 for failure
 Example: changemac(0, BB477_HP5)


=item del_lease 

 This function deletes the desired entry out of the leases file.

 Arguments: 1. The mac address
 Return: Returns an array based on the passed value, or returns 0 for failure
 Example: del_lease(0, BB477_HP5)


=item add 

 This function adds a block to the config file based on parameters.

 Arguments: 1. Hostname (Required)
            2. Mac Address (Required)
	    3. IP Address (Required)
 Return: Returns 1 for success, and 0 for failure

=back

=head2 AUTHORS

 Michael Lewis (mlewis@mailops.com)

=head2 CREDITS

 Thomas Akin, CISSP -	helped with the encryption on the backend

 Borek Lupomesky    -	who's "dhcplst.pl" program provided me with the 
			idea of storing DHCP objects into hashes 

=head2 SEE ALSO

 perl(1)



