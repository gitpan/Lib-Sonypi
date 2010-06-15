#!/usr/bin/perl
#
# $Id: get-bat1cap.pl 5 2010-06-15 15:33:18Z gomor $
#
use strict;
use warnings;

use Lib::Sonypi;

my $r = Lib::Sonypi::getbat1cap();
print "[$r]\n";
