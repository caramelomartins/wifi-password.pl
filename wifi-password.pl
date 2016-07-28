#!/usr/bin/env perl

use strict;
use warnings;

my $version = "0.0.1";
my $networkManager ="/etc/NetworkManager/";
my $ssid = "";
my $pwd = "";

# Help message subroutine.
sub help()
{
    print("\nUsage wifi-password [OPTIONS] [SSID]\n");
    print("\nOptions:\n");
    print(" -v, --version\tOutput version.\n");
    print(" -h, --help\tThis message.\n");
    print("\n");
}

if($#ARGV > -1)
{
    if ($ARGV[0] eq "-v") { print "$version\n"; exit 1; }
    elsif ($ARGV[0] eq "-h") { help(); exit 1; }
    else { $ssid = $ARGV[0] }
};

print "\n";

# Set SSID or use default.
if( $ssid eq "")
{
    $ssid = `nmcli -t -f state,connection d | grep connected: | sed "s/^connected://"`;
    # http://stackoverflow.com/questions/3931569/how-can-i-remove-all-whitespaces-and-linebreaks-in-perl
    $ssid =~ s/\s+//g;
}

# Read from file.
my $path = "$networkManager" . "system-connections/$ssid";
my $command = "sudo cat $path | grep psk= | sed \"s/^psk=//\"";
$pwd = `$command`;

# Print PWD.
print "SSID: $ssid\n";
print "Password: $pwd\n";
