#!/usr/bin/perl
#
# $Id: get-temp.pl 5 2010-06-15 15:33:18Z gomor $
#
use strict;
use warnings;

use Lib::Sonypi;

my $r = Lib::Sonypi::gettemp();
print "[$r]\n";
