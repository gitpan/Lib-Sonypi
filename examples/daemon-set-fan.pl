#!/usr/bin/perl
#
# $Id: daemon-set-fan.pl 6 2010-06-15 15:34:47Z gomor $
#
use strict;
use warnings;

use App::Daemon qw(daemonize);
use EV;
use Lib::Sonypi;

my $w = EV::timer 1, 1, sub {
   my $fan = Lib::Sonypi::getfan();
   print "FAN speed: [$fan]\n";

   my $cpu = Lib::Sonypi::gettemp();
   print "CPU temp: [$cpu]\n";

   if ($cpu < 50) {
      my $r = Lib::Sonypi::setfan(0);
      print "setfan returned: [$r]\n";
   }
   else {
      my $r = Lib::Sonypi::setfan(255);
      print "setfan returned: [$r]\n";
   }
};

daemonize();
EV::loop;
