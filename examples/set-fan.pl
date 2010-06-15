#!/usr/bin/perl
#
# $Id: set-fan.pl 6 2010-06-15 15:34:47Z gomor $
#
use strict;
use warnings;

use Lib::Sonypi;

my $r = Lib::Sonypi::setfan(0);
print "[$r]\n";
