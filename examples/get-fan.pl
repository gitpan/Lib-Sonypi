#!/usr/bin/perl
#
# $Id: get-fan.pl 6 2010-06-15 15:34:47Z gomor $
#
use strict;
use warnings;

use Lib::Sonypi;

my $r = Lib::Sonypi::getfan();
print "[$r]\n";
