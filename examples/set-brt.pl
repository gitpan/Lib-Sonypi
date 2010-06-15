#!/usr/bin/perl
#
# $Id: set-brt.pl 5 2010-06-15 15:33:18Z gomor $
#
use strict;
use warnings;

use Lib::Sonypi;

my $old = Lib::Sonypi::getbrt();

my $r = Lib::Sonypi::setbrt(255);
print "[$r]\n";
sleep(1);
$r = Lib::Sonypi::setbrt(0);
print "[$r]\n";
sleep(1);
$r = Lib::Sonypi::setbrt($old);
print "[$r]\n";
