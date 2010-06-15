#!/usr/bin/perl
#
# $Id: event-loop.pl 13 2010-06-15 17:27:22Z gomor $
#
use strict;
use warnings;

use App::Daemon qw(daemonize);
use Lib::Sonypi qw(:consts);

# Cut bluetooth
$Lib::Sonypi::Events->{SONYPI_EVENT_FNKEY_F1()} = sub {
   Lib::Sonypi::setblue(1); # Due to a bug at resume, we need to do that
   Lib::Sonypi::setblue(0);
   print "DEBUG: cut off bluetooth\n";
};

# Increase screen brightness
$Lib::Sonypi::Events->{SONYPI_EVENT_FNKEY_F5()} = sub {
   my $old = Lib::Sonypi::getbrt();
   my $new = $old - 32;
   Lib::Sonypi::setbrt($new);
   print "DEBUG: brt set to [$new] from [$old]\n";
};

# Decrease screen brightness
$Lib::Sonypi::Events->{SONYPI_EVENT_FNKEY_F6()} = sub {
   my $old = Lib::Sonypi::getbrt();
   my $new = $old + 32;
   Lib::Sonypi::setbrt($new);
   print "DEBUG: brt set to [$new] from [$old]\n";
};

daemonize();
Lib::Sonypi::eventLoop();
