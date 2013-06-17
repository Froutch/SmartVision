#!/usr/bin/perl -Tw
#
# Notes: - Allow certain people to query and others to modify, based on @allowed
# $Id: webdhcpc,v 1.1 2001/05/08 03:28:32 acapp Exp $
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
#
use strict;
use CGI qw(:standard);
use File::Copy;
use Fcntl ':flock';

# Use the following line if you do not have root access to put this
# module in the perl tree
# use lib '/usr/local/Webdhcp';
use Webdhcp_Client;
use Sys::Syslog;

#use Carp ();
#local $SIG{__WARN__} = \&Carp::cluck;

#-----------------------------------------------------------
# Beginning of global variable declarations
#-----------------------------------------------------------
$| = 1;

$ENV{'PATH'} = "/bin:/usr/bin:/usr/local/bin";
$ENV{IFS} = "";
#$> = $< if ($> == 0); ## Squash any root access!

# Grab all variable definitions
require "webdhcp.conf";

my $client = new Webdhcp_Client ($remotehost, $port);
my $query = new CGI;
#-----------------------------------------------------------
# End of global variable declarations
#-----------------------------------------------------------

#***********************************************************

#-----------------------------------------------------------
# Beginning of function definitions
#-----------------------------------------------------------

sub move_to_subnet {
#==================================
# This function prints the page
# to move a machine to a new subnet
#==================================
  my($query) = shift;

  if (!grep {/$user/} @can_delete) {
	error("You are not allowed to execute this option. Please contact administrator.");
  }

  my $new_ip = freeip($query->param('use_this_net'));

  print <<ADD_A;
  <FORM METHOD="POST"  ENCTYPE="application/x-www-form-urlencoded" name="move_it" action="$cgiurl">
    <table width="100%" border="0">
      <tr>
        <td width="25%">Please enter the hardware address of the device you wish to move: </td>
        <td width="35%"><input type="text" name="mac_text"></td>
      </tr>
      <tr>
ADD_A
  
  print $query->hidden('new_ip',"$new_ip"),"\n";

  print <<ADD_M;
        <td width="15%">The following IP Address will be assigned on the new subnet: </td>
        <td width="35%">$new_ip</td>
ADD_M
  
  print <<ADD_B;
      </tr>
    </table>
    <p>
      <input type="Submit" name="Submit" value="Move" onclick="Sysop: alert(\'$alertmessage\');">
      <input type="reset" name="reset" value="Reset">
    </p>
  </FORM>
  </center>
ADD_B
  &footer;
  return;
}

sub make_move_to_subnet {
#===============================
# Execute the move to new subnet
#===============================
  my($query) = shift;
  my($mac, $ip, $hn, @option);
  my $new_ip = $query->param('new_ip');

  my $macmsg = "The Mac address is not formated correctly. I should either be separated by colons (:) or nothing at all. Please go back and try again";
  my $ipmsg = "The IP Address is not formated correctly. Please go back and try again";

  $mac = $query->param('mac_text');
  $mac = lc($mac);
  error ("$macmsg") if (chkmac(\$mac)) == 0;

  #---Find the current data
  @option = ('mac', $mac);
  my %find = ($option[0] => $option[1]);
  my $old_message = $client->connect('F', %find);
  chkmsg($old_message);
  my $msg = translate($old_message);

  #---Filter out the appropriate data from old_message
  $old_message =~ m/host\s(.*)\s\{/;
  $hn = $1;
  $old_message =~ m/fixed\-address\s(.*)\;/;
  $ip = $1;
  #---End of Filter out the appropriate data from message

  #---Delete the current data from DB
  &delfromdb($ip, $hn);
  #---End of delete

  #---Add the new data
  &addtodb($new_ip,$hn);
  @option = ('mac', $mac, 'ip', $new_ip);
  my %add = ($option[0] => $option[1],
	     $option[2] => $option[3]);
  my $add_message = $client->connect('S', %add);
  #---End of Add


  chkmsg($add_message);
  &log("$user moved $hn with mac address of $mac from $ip to $new_ip");

  print <<F;
  The following data has been updated. The new ip addres is <b>$new_ip<b> <br>
  <br>$msg<br>
F

  &footer;
  return;
}

sub delete {
#===============================
# This function prints the form
# to delete an entry in DHCP
#===============================
  #my($query) = shift;

  if (!grep {/$user/} @can_delete) {
	error("You are not allowed to execute this option. Please contact administrator.");
  }
  
  print <<ADD_A;
  <FORM METHOD="POST"  ENCTYPE="application/x-www-form-urlencoded" name="delete_option" action="$cgiurl">
    <table width="100%" border="0">
      <tr>
  	Search for the entry to delete by either MAC address or IP address. <i>Note: This will only find the device to delete, the next screen will actually delete it. </i><br><hr>
      </tr>
      <tr>
        <td width="25%"><input type="radio" name="del_option" value="del_option_mac" checked>
	Enter the MAC address to delete: </td>
        <td width="35%"><input type="text" name="mac_del"></td>
      </tr>
      <tr>
        <td width="25%"> OR </td>
      </tr>
      <tr>
        <td width="25%"><input type="radio" name="del_option" value="del_option_ip">
	 Enter the IP Address to delete: </td>
        <td width="35%"><input type="text" name="ip_del"></td>
      </tr>
    </table>
    <p>
      <input type="submit" name="submit_delete" value="Submit">
      <input type="reset" name="reset" value="Reset">
    </p>
  </FORM>
  </center>
ADD_A
  &footer; 
  return;
}

sub delconfirm {
#===============================
# This function queries the DHCP
# server to find the correct
# entry to delete. You are given
# an opportunity to confirm if
# you want to delete an entry
#===============================
  my($query) = shift;
  my($del_mac, $del_ip, @option, $ip);
  my $macmsg = "The Mac address is not formated correctly. Please go back and try again";
  my $ipmsg = "The IP Address is not formated correctly. Please go back and try again";

  if (defined $query->param('del_option') && $query->param('del_option') =~ /del_option_mac/) {
  	$del_mac = $query->param('mac_del');
	$del_mac = lc($del_mac);
  	error ("$macmsg") if (chkmac(\$del_mac)) == 0;
	@option = ('mac', $del_mac);
  }elsif (defined $query->param('del_option') && $query->param('del_option') =~ /del_option_ip/) {
  	$del_ip = $query->param('ip_del');
	$del_ip = lc($del_ip);
  	error ("$ipmsg") if (chkip($del_ip) == 0);
	@option = ('ip', $del_ip);
  }else{
	error("Please check your data.");
  }
  
  my %a = ($option[0] => $option[1]);
  #my $message = $client->connect('D', $option[0], $option[1]);
  #print "Sending with F, $option[0], $option[1]\n";
  my $message = $client->connect('F', %a);

  #---Filter out the appropriate data from message
  $message =~ m/host\s(.*)\s\{/;
  my $hn = $1;
  $message =~ m/fixed\-address\s(.*)\;/;
  $ip = $1 if (!defined $ip);
  my $msg = translate($message);
  #---End of Filter out the appropriate data from message

  chkmsg($message);

  print "<FORM METHOD=\"POST\"  ENCTYPE=\"application/x-www-form-urlencoded\" name=\"choose\" action=\"$cgiurl\">\n";
  if ($option[0] eq 'ip') {
  	print $query->hidden($option[0],$option[1]),"\n";
  }else{
  	print $query->hidden($option[0],$option[1]),"\n";
  	print $query->hidden('ip',$ip),"\n";
  }
  print $query->hidden('hn',$hn),"\n";
  	print <<F;
  The following information matches the query that you used on the previous page:<br>
  <br>$msg<br>
  <hr>
      <input type="submit" name="submit_delete_yes" value="Delete" onclick="Sysop: alert(\'$alertmessage\');">
      <input type="submit" name="back" value="Reset">
F

  return;
}

sub delentry {
#===============================
# Actually delete the entry
#===============================
  my ($query) = shift;
  my ($u, %v, $message);
  
  if (defined $query->param('mac')){
	$u = $query->param('mac');
	%v = ('mac' => $u);
	$message = $client->connect('D', %v);
	$message =~ s/\n/\n<br>/g;
  }elsif (defined $query->param('ip')){
	$u = $query->param('ip');
	%v = ('ip' => $u);
	$message = $client->connect('D',%v);
	$message =~ s/\n/\n<br>/g;
  }else{
	error("What do you want me to delete?");
  }

  chkmsg($message);
  delfromdb($query->param('ip'), $query->param('hn'));
  success("$u has been successfully deleted from DHCP!\n<br>");
 
}

sub find {
#===============================
# Prints the form out to find
# a record in DHCP Config file
#===============================
  #my($query) = shift;
  
  print <<ADD_A;
  <FORM METHOD="POST"  ENCTYPE="application/x-www-form-urlencoded" name="delete_option" action="$cgiurl">
    <table width="100%" border="0">
      <tr>
  	Search for a device by either MAC address or IP address. Please choose only <b>one</b> option:<br><hr>
      </tr>
      <tr>
        <td width="25%"><input type="radio" name="find_option" value="find_option_mac" checked>
	Enter the MAC address to search for: </td>
        <td width="35%">
	<input type="text" name="mac_find" length=15 maxlength=20>
	</td>
      </tr>
    <!--  <tr>
        <td width="25%" align=center> OR </td>
      </tr> -->
      <tr>
        <td width="25%"><input type="radio" name="find_option" value="find_option_ip">
	Enter the IP Address to search for: </td>
        <td width="35%"><input type="text" name="ip_find"></td>
      </tr>
    </table>
    <p>
      <input type="submit" name="submit_find" value="Submit">
      <input type="reset" name="reset" value="Reset">
    </p>
  </FORM>
  </center>
ADD_A
  &footer;
  return;
}

sub find_lease {
#===============================
# Prints the form out to find
# a record in DHCP Leases file
#===============================
  #my($query) = shift;
  
  print <<ADD_A;
  <FORM METHOD="POST"  ENCTYPE="application/x-www-form-urlencoded" name="search_lease_by" action="$cgiurl">
    <table width="100%" border="0">
      <tr>
  	Search for a device by either MAC address, IP address, or Hostname. Please choose only <b>one</b> option:<br><hr>
      </tr>
      <tr>
        <td width="25%"><input type="radio" name="find_option" value="find_option_mac" checked>
	Enter the MAC address to search for: </td>
        <td width="35%">
	<input type="text" name="mac_find" length=15 maxlength=20>
	</td>
      </tr>
    <!--  <tr>
        <td width="25%" align=center> OR </td>
      </tr> -->
      <tr>
        <td width="25%"><input type="radio" name="find_option" value="find_option_ip">
	Enter the IP Address to search for: </td>
        <td width="35%"><input type="text" name="ip_find"></td>
      </tr>
      <!-- <tr>
        <td width="25%" align=center> OR </td>
      </tr> -->
      <tr>
        <td width="25%"><input type="radio" name="find_option" value="find_option_hn">
	Enter the Hostname to search for: </td>
        <td width="35%"><input type="text" name="hn_find"></td>
    </table>
    <p>
      <input type="submit" name="submit_find_lease" value="Submit">
      <input type="reset" name="reset" value="Reset">
    </p>
  </FORM>
  </center>
ADD_A
  &footer;
  return;
}

sub search {
#===================================
# Finds a record in DHCP Conf file
#===================================
  my($query) = shift;
  my($find_mac, $find_ip, @option);
  my $macmsg = "The Mac address is not formated correctly. Make sure there are no spaces tabs. Please go back and try again";
  my $ipmsg = "The IP Address is not formated correctly. Make sure there are no spaces tabs. Please go back and try again";

  if (defined $query->param('find_option') && $query->param('find_option') =~ /find_option_mac/) {
  	$find_mac = $query->param('mac_find');
	$find_mac = lc($find_mac);
  	error ("$macmsg") if (chkmac(\$find_mac)) == 0;
	@option = ('mac', $find_mac);
  }elsif (defined $query->param('find_option') && $query->param('find_option') =~ /find_option_ip/) {
  	$find_ip = $query->param('ip_find');
	$find_ip = lc($find_ip);
  	error ("$ipmsg") if (chkip($find_ip) == 0);
	@option = ('ip', $find_ip);
  }else{
	error("Please check your data.");
  }
  
  my %a = ($option[0] => $option[1]);
  #my $message = $client->connect('D', $option[0], $option[1]);
  #print "Sending with F, $option[0], $option[1]\n";

  my $message = $client->connect('F', %a);
  my $msg = translate($message);

  chkmsg($message);

  print "<FORM METHOD=\"POST\"  ENCTYPE=\"application/x-www-form-urlencoded\" name=\"choose\" action=\"$cgiurl\">\n";
  print $query->hidden($option[0],$option[1]),"\n";
  	print <<F;
  The following information matches the query that you used on the previous page:<br>
  <br>$msg<br>
F
  footer();
  &log("searched database for $option[1]");

  return 1;
}

sub search_by_lease {
#===================================
# Finds a record in DHCP Leases file
#===================================
  my($query) = shift;
  my($find_mac, $find_ip, $find_hn, @option);
  my $macmsg = "The Mac address is not formated correctly. Make sure there are no spaces or tabs. Please go back and try again";
  my $ipmsg = "The IP Address is not formated correctly. Make sure there are no spaces or tabs. Please go back and try again";
  my $hnmsg = "The Hostname is not formated correctly. Make sure there are no spaces or tabs. Please go back and try again";

  if (defined $query->param('find_option') && $query->param('find_option') =~ /find_option_mac/) {
  	$find_mac = $query->param('mac_find');
	$find_mac = lc($find_mac);
  	error ("$macmsg") if (chkmac(\$find_mac)) == 0;
	@option = ('mac', $find_mac);
  }elsif (defined $query->param('find_option') && $query->param('find_option') =~ /find_option_ip/) {
  	$find_ip = $query->param('ip_find');
	$find_ip = lc($find_ip);
  	error ("$ipmsg") if (chkip($find_ip) == 0);
	@option = ('ip', $find_ip);
  }elsif (defined $query->param('find_option') && $query->param('find_option') =~ /find_option_hn/) {
  	$find_hn = $query->param('hn_find');
	#$find_hn = lc($find_hn);
  	error ("$hnmsg") if (chkhn($find_hn) == 0);
	@option = ('hn', $find_hn);
  }else{
	error("Please check your data.");
  }
  
  my %a = ($option[0] => $option[1]);

  my $message = $client->connect('L', %a);
  my $msg = translate($message);

  chkmsg($message);

  print "<FORM METHOD=\"POST\"  ENCTYPE=\"application/x-www-form-urlencoded\" name=\"choose\" action=\"$cgiurl\">\n";
  print $query->hidden($option[0],$option[1]),"\n";
  	print <<F;
  The following information matches the query that you used on the previous page. Please note that these times are in GMT.<br>
  <hr>
  <br>
  $msg
  <br>
F
  footer();
  &log("searched leases database for $option[1]");

  return 1;
}

sub add {
#===============================
# Prints out the form to add a
# new entry to DHCP.
#===============================
  
  my($query) = shift;

  if (chkuser($user) != 1){
	error("You are not allowed to execute this option. Please contact administrator.");
  }

  my $available = freeip($query->param('use_this_net'));
  
  print <<ADD_A;
  <FORM METHOD="POST"  ENCTYPE="application/x-www-form-urlencoded" name="addit" action="$cgiurl">
    <table width="100%" border="0">
      <tr>
        <td width="15%">Please enter the host name: </td>
        <td width="35%"><input type="text" name="hn_text"></td>
      </tr>
      <tr>
        <td width="15%">Please enter the MAC address: </td>
        <td width="35%"><input type="text" name="mac_text"></td>
      </tr>
      <tr>
ADD_A
  
  print $query->hidden('ip_text',"$available"),"\n";
  
  print <<ADD_M;
        <td width="15%">The following IP Address is available: </td>
        <td width="35%">$available</td>
ADD_M
  
  print <<ADD_B;
      </tr>
    </table>
    <p>
      <input type="Submit" name="Submit" value="Add" onclick="Sysop: alert(\'$alertmessage\');">
      <input type="reset" name="reset" value="Reset">
    </p>
  </FORM>
  </center>
ADD_B
  
 &footer; 
 return;
}

sub addnewentry {
#===============================
# Adds the data gathered from
# the Add Form to DHCP
#===============================
  my($query) = shift;
  my($add_mac, $add_ip, $add_hn);
  
  if (defined $query->param('mac_text')) {
  	$add_mac = $query->param('mac_text');
	$add_mac = lc($add_mac);
  }

  $add_ip = $query->param('ip_text') if defined $query->param('ip_text');

  if (defined $query->param('hn_text')) {
  	$add_hn = $query->param('hn_text');
	$add_hn = lc($add_hn);
  }
  
  my $macmsg = "The Mac address is not formated correctly. Please go back and try again";
  my $hnmsg = "The Hostname is not formated correctly. Make sure that there are NO spaces. Please go back and try again";

  error ("$macmsg") if (chkmac(\$add_mac)) == 0;
  error ("$hnmsg") if (chkhn($add_hn) == 0);

  #addtodb ($add_ip, $add_hn);
  #my $message = $client->connect('A', $add_mac, $add_ip, $add_hn);

  my %a = ('mac' => $add_mac,
	   'ip' => $add_ip,
	   'hn' => $add_hn);

  my $message = $client->connect('A', %a);
  #my $message = "ERROR";
  $message =~ s/\n/\n<br>/g;

  chkmsg($message);
  addtodb ($add_ip, $add_hn);
  success("The following information has Successfully been entered into DHCP\n\n<br>$message");

  return 1;
}

sub picknet {
#==================================
# This function prints out a form
# which asks you to choose the
# network you want to add to. This
# is based soley off documentation
# files. Future releases will make
# this more flexable
#==================================
  
  my($query, $called_function) = @_;
  error ("Not enough arguments!") if (!defined $called_function);
  my(@sort, @slist);

  if (chkuser($user) != 1){
	error("You are not allowed to execute this option. Please contact administrator.");
  }
  
  print <<ADD;
  <FORM METHOD="POST"  ENCTYPE="application/x-www-form-urlencoded" name="choosenet" action="$cgiurl">
    <table width="100%" border="0">
      <tr>
        <td width="15%">What subnet would you like to use? : </td>
        <td width="35%">$mynet
ADD
  
  opendir (SDIR,"$subnetdir") || die "can't opendir $subnetdir: $!";
  #@slist = grep { /^\./ && -f "$subnetdir/$_"} readdir(SDIR);
  @slist = grep { /^[0-9].*\.x/} readdir(SDIR);
  closedir (SDIR);
  
  #sort @slist;
  
  print "<select name=\"use_this_net\">\n";
  
  sub by_number {
      $a =~ s/\.x//g;
      $b =~ s/\.x//g;
      $a <=> $b;
  }
  
  foreach ( sort by_number @slist){
  	#$_ =~ s/\.x//g;
  	print "<option value=\"$_\">$_\n";
  }
  print "</select>\n";

  print $query->hidden('q',"$called_function"),"\n";
  
  print <<ADD_A;
  	.0</td>
      </tr>
    </table>
    <p>
      <input type="submit" name="Submit" value="Submit">
      <input type="reset" name="reset" value="Reset">
    </p>
  </FORM>
  </center>
  
ADD_A

  &footer;
  return;
}

sub addtodb {
#===============================
# This function Adds the data
# to local documentation.
#===============================  
  my ($ip, $hn) = @_;       
  my (@a,@rest,$addf, $l, $cfgfile);
  @a = split (/\./, $ip);
	#print "Splitting @a\n";
  $addf = "$a[2].x";
  #print "$ipdir/$addf\n";
  #print "Adding to db file $ipdir/$addf\n";
  open(DB, "$ipdir/$addf") || error("Cannot open file $addf: $!. Please contact Administrator");
  flock (DB, LOCK_SH);
  while ($l = <DB>) {
  	if ($l !~ /$ip/){
  		push (@rest, $l);# if ($l !~ /$ip/);
  		next;
  	}
  	#print "Here is old the line $l and name: $hn\n<br>";
  	$l =~ s/$l/$ip\t$hn\n/g;
  	#print "Here is new the line $l and name: $hn\n<br>";
  	push (@rest, $l);
  }
  flock (DB, LOCK_UN);
  close (DB);

  system 'cp', '-f', "$ipdir/$addf", "$ipbackdir";
  $cfgfile = "$ipdir" . "/$addf";
  #die "Filename format is not valid" unless ($cfgfile =~ m/^($ipdir\/$addf)$/);
  #$cfgfile =~ m/^($ipdir\/$addf)$/;
  $cfgfile =~ m/^(.*)$/;
  $cfgfile = $1;
  	open(NEWDB,">$cfgfile") || error("Cannot open file $cfgfile for writing as $>: $!");
  	flock (NEWDB, LOCK_EX);
  	print NEWDB @rest;
  	flock (NEWDB, LOCK_UN);
  	close(NEWDB);
  	#print "Done updating documentation.";
	&log("added $hn to database with an ip address of $ip");

    return;                            
}                 

sub delfromdb {
#===============================
# This function Deletes the data
# to local documentation.
#===============================  
  my ($ip,$hn) = @_;       
  my (@a,@rest,$addf, $l, $cfgfile);
  #print "here is the IP: $ip\n";
  @a = split (/\./, $ip);
	#print "Splitting @a\n";
  $addf = "$a[2].x";
  #print "here is the IP file name: $a[2].x\n";
  #print "Deleting from db file $ipdir/$addf\n";
  #print "$ipdir/$addf\n";
  open(DB, "$ipdir/$addf") || error("Cannot open file $addf: $!. Please contact Administrator");
  flock (DB, LOCK_SH);
  while ($l = <DB>) {
  	if ($l !~ /$ip/){
  		push (@rest, $l);
  		next;
  	}else{
  		#print "Here is old the line $l and name: $hn\n<br>";
  		$l =~ s/^(\d.*)\s(\w.*)/$1/g;
  		#print "Here is the new line: $l\n<br>";
  		push (@rest, $l);
	}
  }
  flock (DB, LOCK_UN);
  close (DB);

  system 'cp', '-f', "$ipdir/$addf", "$ipbackdir";
  $cfgfile = "$ipdir" . "/$addf";
  $cfgfile =~ m/^(.*)$/;
  $cfgfile = $1;
  	open(NEWDB,">$cfgfile") || error("Cannot open file $cfgfile for writing as $>: $!");
	flock (NEWDB, LOCK_EX);
  	print NEWDB @rest;
	flock (NEWDB, LOCK_UN);
  	close(NEWDB);
  	#print "Done updating documentation.";
	&log("deleted $hn from database with an ip of $ip");

    return;                            
}                 

sub changemac {
#===============================
# This function prints the page
# for adding a new MAC address
#===============================
  if (chkuser($user) != 1){
	error("You are not allowed to execute this option. Please contact administrator.");
  }
  
  print <<CHANGE;
  <FORM METHOD="POST"  ENCTYPE="application/x-www-form-urlencoded" name="do_change_mac" action="$cgiurl">
    <table width="100%" border="0">
      <tr>
  	Please enter the following information: <br><hr>
      </tr>
      <tr>
	<td> Please enter the <b>old</b> MAC address: </td>
        <td width="35%"><input type="text" name="old_mac"></td>
      </tr>
      <tr>
	<td> Please enter the <b>new</b> MAC address: </td>
        <td width="35%"><input type="text" name="new_mac"></td>
      </tr>
    </table>
    <p>
      <input type="submit" name="submit_mac_change" value="Submit">
      <input type="reset" name="reset" value="Reset">
    </p>
  </FORM>
  </center>
CHANGE

  &footer;
  return;
}

sub changentry {
#===============================
# Changes the old MAC address
# to the new one in DHCP
#===============================
  my ($query) = shift;
  my ($oldmac, $newmac, $omsg, $nmsg, %v, $message);

  $omsg = "The formatting for the OLD mac address is incorrect. Please go back and try again";
  $nmsg = "The formatting for the NEW mac address is incorrect. Please go back and try again";

  if (defined $query->param('old_mac') && defined $query->param('new_mac')) {
  	$oldmac = $query->param('old_mac');
	$newmac = $query->param('new_mac');
	$oldmac = lc($oldmac);
	$newmac = lc($newmac);
  	error ("$omsg") if (chkmac(\$oldmac)) == 0;
  	error ("$nmsg") if (chkmac(\$newmac)) == 0;
  } else {
	error ("Please supply both the old and the new mac address.");
	return 0;
  }

  %v = ('omac' => $oldmac,
  	'nmac' => $newmac);

  $message = $client->connect('C',%v);
  $message =~ s/\n/\n<br>/g;

  chkmsg($message);
  success("$oldmac has been changed to $newmac in DHCP!\n<br>");
  &log("changed mac address $oldmac to $newmac");

  return 1;
}

sub chkmsg {
#=================================
# This function checks the message
# from the WebDHCP daemon and 
# prints the appropriate message.
# Returns 0 with error message.
#=================================
  my ($m) = shift;

  if ($m =~ /ERROR/i){
	error ("$m");
  }
  if ($m =~ /^Can\'t\ connect\ to/i){
	error ("The Server is Down! \b\<br>Please contact the Adminstrator");
	return 0;
  }
  if ($m =~ /^Access Denied/i){
	error ("The Server is not allowing connections at this time! \b\<br>Please contact the Adminstrator");
	return 0;
  }
  return 1;
}

sub chkmac {
#=================================
# This function checks the format
# of the MAC address. Returns 0
# if the address is not formated
# correctly
#=================================
  	my ($a) = shift;
  	my $ok = 1;
	#print "This is the length: ", length($$a), " of $$a\n<br>";
	$$a =~ s/\s//g;
	if (length($$a) == 12){
		$$a =~ s/^([0-9A-Fa-f]{2})([0-9A-Fa-f]{2})([0-9A-Fa-f]{2})([0-9A-Fa-f]{2})([0-9A-Fa-f]{2})([0-9A-Fa-f]{2})$/$1:$2:$3:$4:$5:$6/g;
		#print "This is the new value: ", $$a, "\n<br>";
	}
  	$ok = 0 if ($$a !~ /^[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}:[0-9A-Fa-f]{2}$/); 
  	return $ok;
}

sub chkip {
#=================================
# This function checks the format
# of the IP address. Returns 0
# if misformated
#=================================
  	my ($i) = shift;
	#$i =~ s/\s//g;
  	my $ok = 1;
  	$ok = 0 if ($i !~ /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/);  
	#print "This is the ip: -$i-\n<br>";
  	return $ok;
}

sub chkhn {
#=================================
# This function checks the format
# of the Hostname. Returns 0
# if misformated
#=================================
  	my ($c) = shift;
  	my $ok = 1;
  	$ok = 0 if ($c =~ /\s/ || $c !~ /\w+/ || $c =~ /[\#\!\@\$\%\^\&\*\(\)\]]/); 
  	return $ok;
}

sub chkuser {
#=================================
# This function checks to see if
# the user is allowed to access
# the WebDHCP form
#=================================
  	my ($u) = shift;
  	my $ok = 0;
  	$ok = 1 if (grep {/$user/} @allowed); 
  	return $ok;
}

sub freeip {
#===============================
# This function looks for the next
# available ip address, and returns
# it.
#===============================
  my ($l, $net, $available, $startip, $ipfile, @freelist, @a);
  my ($net1, $net2, $sub, $mip) = undef;
  $net = shift;
  $available = "n/a";
  $startip = 30;
  
  error("$net subnet is not avaliable. Please choose another subnet or contact the administrator") if (! -f "$ipdir/$net.x");

  open(DOC,"$ipdir/$net.x") || error("Cannot open $ipdir/$net.x: $!");
  flock(DOC,LOCK_SH);
  while ($l = <DOC>) {
  	@a = split (/\s/,$l);
  	($net1, $net2, $sub, $mip) = split(/\./, $a[0]);

  	if (!defined $a[1] && $mip >= $startip){
  		push(@freelist, $a[0]);
  	}else{
  		next;
	}
  }
  	if ($#freelist < $limit){
		$#freelist = 0 if ($#freelist == -1);
		&log("There are only $#freelist ip addresses available for the $mynet.$net.0 subnet!",'warning');
  		error("There are only a few ip addresses available for the $mynet.$net.0 subnet. Please contact the network administrator");
  	}else{
  		$available = $freelist[0];
  	}
  flock(DOC,LOCK_UN);
  close(DOC);
  
  return $available;
}

sub heading {
#===============================
# Prints the HTML Header
#===============================
my($query) = shift;

#	my $mycookie = $query->cookie(  -name=>'cookie_uname',
#					-value=>"$sessionid",
#					-expires=>'+1m',
#					-path=>'/cgi-bin/',
#					-domain=>'network.mynetwork.com',
#					-secure=>'1'
#					);
#	print $query->header(-cookie=>$mycookie);

	print $query->header;
	print $query->start_html(-title=>"$htmltitle",
                         -author=>'Michael Lewis',
                         -BGCOLOR=>'white');
	print "<h1>$htmltitle</h1>\n";
	return;
}

sub footer {
#===============================
# Prints the HTML Footer
#===============================
my($query) = shift;

print <<F;
  <hr>
	<center>
	This page dynamically created by <strong>Perl</strong><br>
	<i>Author: Michael Lewis</i><br>
	<a href=$cgiurl>$htmltitle</a> |
  	<a href="$networkhome">$hometitle</a><br>
	</center>
F
	return;
}

sub success {
#===============================
# Prints a success page with
# the appropriate response from
# the WebDHCP daemon
#===============================
        my ($e) = shift;
        #print $query->header;
	if ($e !~ /\<br\>/i) {
		$e =~ s/\n/\n<br>/g;
	}

#	print <<TABLE_OPEN;
#	<table border=1>
#	<tr><td>
#TABLE_OPEN
        print "<b><font color=blue>$e</font></b>\n";
#
#	print <<TABLE_CLOSE;
#	</td></tr>
#	</TABLE>
#TABLE_CLOSE

	&footer();
}

sub translate {
#=========================================================================
# Translates the message returned from WebDHCP into readable HTML
#=========================================================================
  my ($msg) = @_;
  
  if (!defined $msg or $msg !~ /\w.*|\d.*/){
	error("Invalid DATA! Please contact the Administrator!");
  }

  ##--- Reformat the message for readability ---##
  $msg =~ s/host\s(.*)\s*\{/Hostname: <font color=blue>$1<\/font>/g; 
  $msg =~ s/hardware\sethernet\s(.*)\;/Hardware address: <font color=blue>$1<\/font>/g; 
  $msg =~ s/hardware\stoken-ring\s(.*)\;/Hardware address: <font color=blue>$1<\/font>/g; 
  $msg =~ s/fixed\-address\s(.*)\;/IP address: <font color=blue>$1<\/font>/g; 
  $msg =~ s/option(.*)\;\n//g; 
  #$msg =~ s/\}\n//g; 
  $msg =~ s/\}\n/<br>/g; 
  ##--------------------------------------------##
  $msg =~ s/lease\s(.*)\{/IP Address: <font color=blue>$1<\/font>/g; 
  $msg =~ s/starts\s\d\s(.*)\;/Lease started: <font color=blue>$1<\/font>/g; 
  $msg =~ s/ends\s\d\s(.*)\;/Lease ends: <font color=blue>$1<\/font>/g; 
  $msg =~ s/uid\s(.*)\;/UID: <font color=blue>$1<\/font>/g; 
  $msg =~ s/client\-hostname\s(.*)\;/Hostname: <b><font color=blue>$1<\/font><\/b>/g; 
  $msg =~ s/\n/\n<br>/g;

  return $msg;
}

sub log {
#=========================================================================
# Logs the user's action via Syslog
#=========================================================================
  my ($entry, $severity) = @_;
  my ($level);

  if (!defined $severity) {
	$level = $log_level;
  }else{
	$level = $severity;
  }

  $entry =~ s/\n//g;
  openlog('DHCP','ndelay,pid',"$priority");
  syslog("$level", "User $user $entry");
  closelog;

  return;
}

sub error {
#===============================
# Prints out an error page
#===============================
	my ($e,$f) = @_;
	#print $query->header;
	if ($e !~ /\<br\>/i) {
		$e =~ s/\n/\n<br>/g;
	}
	print "<b><font color=red>$e</font></b>\n";
	footer() if (!defined $f); ## Hack to prevent footer from printing in some cases
	#print "</BODY></HTML>\n";
	exit(1);
} ## There is also a "heading" function in the $query function

#-----------------------------------------------------------
# End of function definitions
#-----------------------------------------------------------

#***********************************************************

#-----------------------------------------------------------
# MAIN Function
#-----------------------------------------------------------

&main::heading($query);

my $rf = $query->referer();

#print "<b>-$rf-</b>\n<br>";

if (!defined $rf || $rf !~ m/$full_secure_url|$full_insecure_url|$partial_secure_url|$partial_insecure_url/){
	error("Access Denied! Check the path in which you entered this page.\n", 1);
	$query->end_html;
	exit(0);
}
error("The server is currently down for maintenance. Please contact the administrator if you have any urgent problems.<p>Thanks, Admin") if (-f "$workingdir/working");

error("Access Denied! You must be a valid user to use this resource.\n") if (!defined $user);

if (!defined $query->param()){

print <<Initial;

  <FORM METHOD="POST"  ENCTYPE="application/x-www-form-urlencoded" name="choose" action="$cgiurl">
    <table width="100%" border="0">
      <tr>
        <td width="5%">
          <input type="radio" name="radiobutton" value="add" checked>
        </td>
        <td width="95%">Add a new Static IP address to DHCP</td>
      </tr>
      <tr>
        <td width="5%">
          <input type="radio" name="radiobutton" value="search">
        </td>
        <td width="95%">Search for a <b>static</b> host entry by IP or MAC address </td>
      </tr>
        <td width="5%">
          <input type="radio" name="radiobutton" value="lease">
        </td>
        <td width="95%">Search for a <b>dynamic</b> host entry by IP, MAC address, or hostname (<b>NEW</b>)</td>
      </tr>
        <td width="5%">
          <input type="radio" name="radiobutton" value="change_mac">
        </td>
        <td width="95%">Change the MAC address of a particular device (i.e., installing a new jetdirect card)</td>
      </tr>
      <tr>
        <td width="5%">
          <input type="radio" name="radiobutton" value="delete">
        </td>
        <td width="95%">Delete a DHCP entry (<b> carefully!</b>)</td>
      </tr>
      <tr>
        <td width="5%">
          <input type="radio" name="radiobutton" value="move_to_subnet">
        </td>
        <td width="95%">Move a device to a new subnet </td>
      </tr>
      <!-- <tr>
        <td width="5%">
          <input type="radio" name="radiobutton" value="modify_static">
        </td>
        <td width="95%">Modify a documented static IP address. This will not be put in DHCP (Testing)</td>
      </tr> -->
    </table>
    <p> 
      <input type="submit" name="Submit" value="Submit">
    </p>
  </FORM>
  </center>
Initial
  &footer;
  
  } else {

##################################################
## If an option was selected
##################################################


	#################
	## PICK SUBNET
	#---------------#
  	picknet($query, 'move_to_subnet') if (defined $query->param('radiobutton') and $query->param('radiobutton') =~ /^move_to_subnet$/ and (!defined $query->param('use_this_net')));

  	picknet($query, 'add') if (defined $query->param('radiobutton') and $query->param('radiobutton') =~ /^add$/ and (!defined $query->param('use_this_net')));
	#---------------#

	#################
	## DELETE
	#---------------#
  	&delete() if (defined $query->param('radiobutton') && $query->param('radiobutton') =~ /delete/ ); 
  	&delconfirm($query) if (defined $query->param('submit_delete')); 

  	if (defined $query->param('submit_delete_yes')){
		#print $query->start_html(-onload=>"alert\(\'$alertmessage\'\)\;");
		delentry($query);
	}
	#---------------#

	#################
	## CHANGE MAC ADDRESS
	#---------------#
  	&changemac() if (defined $query->param('radiobutton') && $query->param('radiobutton') =~ /change_mac/); 
  	&changentry($query) if (defined $query->param('submit_mac_change')); 
	#---------------#

	#################
	## NOT AN OPTION
	#---------------#
  	&error("This option is not available yet.") if (defined $query->param('radiobutton') && $query->param('radiobutton') =~ /add_sub/); 
	#---------------#

	#################
	## MOVE 2 SUBNET
	#---------------#
  	&move_to_subnet($query) if (defined $query->param('q') && $query->param('q') =~ /move_to_subnet/ ); 
  	&make_move_to_subnet($query) if (defined $query->param('new_ip'));

	#################
	## SEARCH/FIND
	#---------------#
  	&find() if (defined $query->param('radiobutton') && $query->param('radiobutton') =~ /search/ ); 
  	&find_lease() if (defined $query->param('radiobutton') && $query->param('radiobutton') =~ /lease/ ); 
  	&search($query) if (defined $query->param('submit_find')); 
  	&search_by_lease($query) if (defined $query->param('submit_find_lease')); 
	#---------------#

	#################
	## ADD ENTRY
	#---------------#
  	&add($query) if (defined $query->param('use_this_net')  && ($query->param('q') =~ 'add')); 

  	if (defined $query->param('ip_text')){
		#print $query->start_html(-onload=>"alert\(\'$alertmessage\'\)\;");
  		addnewentry($query);
	}
	#---------------#
  }
  	$query->end_html;

##################################################
## End main
##################################################
