#!/usr/bin/env perl

use strict;
use warnings;

my $version        = "0.0.2";
my $networkManager = "/etc/NetworkManager/";
my $ssid           = "";
my $pwd            = "";

# Help message subroutine.
sub help() {
    print("\nUsage wifi-password [OPTIONS] [SSID]\n");
    print("\nOptions:\n");
    print(" -v, --version\tOutput version.\n");
    print(" -h, --help\tThis message.\n");
    print("\n");
}

# Check dependencies.
sub checkDependencies() {
    if    ( `which perl` eq "" )  { die "ERROR: perl not installed.\n\n" }
    elsif ( `which nmcli` eq "" ) { die "ERROR: nmcli not installed.\n\n" }
    elsif ( `which cat` eq "" )   { die "ERROR: cat not installed.\n\n" }
    elsif ( `which grep` eq "" )  { die "ERROR: grep not intsalled.\n\n" }
    elsif ( `which sed` eq "" )   { die "ERROR: sed not installed.\n\n" }
}

if ( $#ARGV > 0 ) {
    help();
    exit 1;
}
elsif ( $#ARGV > -1 ) {
    if    ( $ARGV[0] eq "-v" ) { print "$version\n"; exit 1; }
    elsif ( $ARGV[0] eq "-h" ) { help();             exit 1; }
    else                       { $ssid = $ARGV[0] }
}

print "\n";

checkDependencies();

# Set SSID or use default.
if ( $ssid eq "" ) {
    $ssid =
`nmcli -t -f type,state,connection d | grep wifi | grep connected: | sed "s/^wifi:connected://"`;

# http://stackoverflow.com/questions/3931569/how-can-i-remove-all-whitespaces-and-linebreaks-in-perl
    $ssid =~ s/\s+//g;

    unless ( $ssid ne "" ) {
        die "ERROR: SSID couldn't be found. Are you connected to wifi?\n\n";
    }
}

# Verify that a Network connection exists.
my $path = "$networkManager" . "system-connections/$ssid";

unless ( -e $path ) {
    die "ERROR: SSID \"$ssid\" is not defined on this machine.\n\n";
}

# Read from file.
my $command = "sudo cat $path | grep psk= | sed \"s/^psk=//\"";
$pwd = `$command`;

# Print SSID & PWD.
print "SSID: $ssid\n";
print "Password: $pwd\n";
