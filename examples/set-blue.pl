#!/usr/bin/perl
#
# $Id: set-blue.pl 5 2010-06-15 15:33:18Z gomor $
#
use strict;
use warnings;

use Lib::Sonypi;

my $r = Lib::Sonypi::setblue(0);
print "[$r]\n";
sleep(1);
$r = Lib::Sonypi::setblue(1);
print "[$r]\n";
sleep(1);
$r = Lib::Sonypi::setblue(0);
print "[$r]\n";
