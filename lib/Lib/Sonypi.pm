#
# $Id: Sonypi.pm 14 2010-06-15 17:34:55Z gomor $
#
package Lib::Sonypi;
use strict; use warnings;

use base qw(Exporter DynaLoader);

our $VERSION = '0.80';

__PACKAGE__->bootstrap($VERSION);

our %EXPORT_TAGS = (
   consts => [qw(
      SONYPI_EVENT_JOGDIAL_DOWN
      SONYPI_EVENT_JOGDIAL_UP
      SONYPI_EVENT_JOGDIAL_DOWN_PRESSED
      SONYPI_EVENT_JOGDIAL_UP_PRESSED
      SONYPI_EVENT_JOGDIAL_PRESSED
      SONYPI_EVENT_JOGDIAL_RELEASED
      SONYPI_EVENT_CAPTURE_PRESSED
      SONYPI_EVENT_CAPTURE_RELEASED
      SONYPI_EVENT_CAPTURE_PARTIALPRESSED
      SONYPI_EVENT_CAPTURE_PARTIALRELEASED
      SONYPI_EVENT_FNKEY_ESC
      SONYPI_EVENT_FNKEY_F1
      SONYPI_EVENT_FNKEY_F2
      SONYPI_EVENT_FNKEY_F3
      SONYPI_EVENT_FNKEY_F4
      SONYPI_EVENT_FNKEY_F5
      SONYPI_EVENT_FNKEY_F6
      SONYPI_EVENT_FNKEY_F7
      SONYPI_EVENT_FNKEY_F8
      SONYPI_EVENT_FNKEY_F9
      SONYPI_EVENT_FNKEY_F10
      SONYPI_EVENT_FNKEY_F11
      SONYPI_EVENT_FNKEY_F12
      SONYPI_EVENT_FNKEY_1
      SONYPI_EVENT_FNKEY_2
      SONYPI_EVENT_FNKEY_D
      SONYPI_EVENT_FNKEY_E
      SONYPI_EVENT_FNKEY_F
      SONYPI_EVENT_FNKEY_S
      SONYPI_EVENT_FNKEY_B
      SONYPI_EVENT_BLUETOOTH_PRESSED
      SONYPI_EVENT_PKEY_P1
      SONYPI_EVENT_PKEY_P2
      SONYPI_EVENT_PKEY_P3
      SONYPI_EVENT_BACK_PRESSED
      SONYPI_EVENT_LID_CLOSED
      SONYPI_EVENT_LID_OPENED
      SONYPI_EVENT_BLUETOOTH_ON
      SONYPI_EVENT_BLUETOOTH_OFF
      SONYPI_EVENT_HELP_PRESSED
      SONYPI_EVENT_FNKEY_ONLY
      SONYPI_EVENT_JOGDIAL_FAST_DOWN
      SONYPI_EVENT_JOGDIAL_FAST_UP
      SONYPI_EVENT_JOGDIAL_FAST_DOWN_PRESSED
      SONYPI_EVENT_JOGDIAL_FAST_UP_PRESSED
      SONYPI_EVENT_JOGDIAL_VFAST_DOWN
      SONYPI_EVENT_JOGDIAL_VFAST_UP
      SONYPI_EVENT_JOGDIAL_VFAST_DOWN_PRESSED
      SONYPI_EVENT_JOGDIAL_VFAST_UP_PRESSED
      SONYPI_EVENT_ZOOM_PRESSED
      SONYPI_EVENT_THUMBPHRASE_PRESSED
      SONYPI_EVENT_MEYE_FACE
      SONYPI_EVENT_MEYE_OPPOSITE
      SONYPI_EVENT_MEMORYSTICK_INSERT
      SONYPI_EVENT_MEMORYSTICK_EJECT
      SONYPI_EVENT_ANYBUTTON_RELEASED
      SONYPI_EVENT_BATTERY_INSERT
      SONYPI_EVENT_BATTERY_REMOVE
      SONYPI_EVENT_FNKEY_RELEASED
      SONYPI_EVENT_WIRELESS_ON
      SONYPI_EVENT_WIRELESS_OFF
      SONYPI_EVENT_ZOOM_IN_PRESSED
      SONYPI_EVENT_ZOOM_OUT_PRESSED
      SONYPI_EVENT_CD_EJECT_PRESSED
      SONYPI_EVENT_MODEKEY_PRESSED
      SONYPI_EVENT_PKEY_P4
      SONYPI_EVENT_PKEY_P5
      SONYPI_EVENT_SETTINGKEY_PRESSED
      SONYPI_EVENT_VOLUME_INC_PRESSED
      SONYPI_EVENT_VOLUME_DEC_PRESSED
      SONYPI_EVENT_BRIGHTNESS_PRESSED
   )],
   subs => [qw(
      getbrt
      setbrt
      getbat1cap
      getbat1rem
      getbat2cap
      getbat2rem
      getbatflags
      getblue
      setblue
      getfan
      setfan
      gettemp
      eventLoop
   )],
   vars => [qw(
      $Events
   )],
);

our @EXPORT_OK = (
   @{$EXPORT_TAGS{vars}},
   @{$EXPORT_TAGS{consts}},
   @{$EXPORT_TAGS{subs}},
);

use constant SONYPI_EVENT_JOGDIAL_DOWN               =>  1;
use constant SONYPI_EVENT_JOGDIAL_UP                 =>  2;
use constant SONYPI_EVENT_JOGDIAL_DOWN_PRESSED       =>  3;
use constant SONYPI_EVENT_JOGDIAL_UP_PRESSED         =>  4;
use constant SONYPI_EVENT_JOGDIAL_PRESSED            =>  5;
use constant SONYPI_EVENT_JOGDIAL_RELEASED           =>  6;
use constant SONYPI_EVENT_CAPTURE_PRESSED            =>  7;
use constant SONYPI_EVENT_CAPTURE_RELEASED           =>  8;
use constant SONYPI_EVENT_CAPTURE_PARTIALPRESSED     =>  9;
use constant SONYPI_EVENT_CAPTURE_PARTIALRELEASED    => 10;
use constant SONYPI_EVENT_FNKEY_ESC                  => 11;
use constant SONYPI_EVENT_FNKEY_F1                   => 12;
use constant SONYPI_EVENT_FNKEY_F2                   => 13;
use constant SONYPI_EVENT_FNKEY_F3                   => 14;
use constant SONYPI_EVENT_FNKEY_F4                   => 15;
use constant SONYPI_EVENT_FNKEY_F5                   => 16;
use constant SONYPI_EVENT_FNKEY_F6                   => 17;
use constant SONYPI_EVENT_FNKEY_F7                   => 18;
use constant SONYPI_EVENT_FNKEY_F8                   => 19;
use constant SONYPI_EVENT_FNKEY_F9                   => 20;
use constant SONYPI_EVENT_FNKEY_F10                  => 21;
use constant SONYPI_EVENT_FNKEY_F11                  => 22;
use constant SONYPI_EVENT_FNKEY_F12                  => 23;
use constant SONYPI_EVENT_FNKEY_1                    => 24;
use constant SONYPI_EVENT_FNKEY_2                    => 25;
use constant SONYPI_EVENT_FNKEY_D                    => 26;
use constant SONYPI_EVENT_FNKEY_E                    => 27;
use constant SONYPI_EVENT_FNKEY_F                    => 28;
use constant SONYPI_EVENT_FNKEY_S                    => 29;
use constant SONYPI_EVENT_FNKEY_B                    => 30;
use constant SONYPI_EVENT_BLUETOOTH_PRESSED          => 31;
use constant SONYPI_EVENT_PKEY_P1                    => 32;
use constant SONYPI_EVENT_PKEY_P2                    => 33;
use constant SONYPI_EVENT_PKEY_P3                    => 34;
use constant SONYPI_EVENT_BACK_PRESSED               => 35;
use constant SONYPI_EVENT_LID_CLOSED                 => 36;
use constant SONYPI_EVENT_LID_OPENED                 => 37;
use constant SONYPI_EVENT_BLUETOOTH_ON               => 38;
use constant SONYPI_EVENT_BLUETOOTH_OFF              => 39;
use constant SONYPI_EVENT_HELP_PRESSED               => 40;
use constant SONYPI_EVENT_FNKEY_ONLY                 => 41;
use constant SONYPI_EVENT_JOGDIAL_FAST_DOWN          => 42;
use constant SONYPI_EVENT_JOGDIAL_FAST_UP            => 43;
use constant SONYPI_EVENT_JOGDIAL_FAST_DOWN_PRESSED  => 44;
use constant SONYPI_EVENT_JOGDIAL_FAST_UP_PRESSED    => 45;
use constant SONYPI_EVENT_JOGDIAL_VFAST_DOWN         => 46;
use constant SONYPI_EVENT_JOGDIAL_VFAST_UP           => 47;
use constant SONYPI_EVENT_JOGDIAL_VFAST_DOWN_PRESSED => 48;
use constant SONYPI_EVENT_JOGDIAL_VFAST_UP_PRESSED   => 49;
use constant SONYPI_EVENT_ZOOM_PRESSED               => 50;
use constant SONYPI_EVENT_THUMBPHRASE_PRESSED        => 51;
use constant SONYPI_EVENT_MEYE_FACE                  => 52;
use constant SONYPI_EVENT_MEYE_OPPOSITE              => 53;
use constant SONYPI_EVENT_MEMORYSTICK_INSERT         => 54;
use constant SONYPI_EVENT_MEMORYSTICK_EJECT          => 55;
use constant SONYPI_EVENT_ANYBUTTON_RELEASED         => 56;
use constant SONYPI_EVENT_BATTERY_INSERT             => 57;
use constant SONYPI_EVENT_BATTERY_REMOVE             => 58;
use constant SONYPI_EVENT_FNKEY_RELEASED             => 59;
use constant SONYPI_EVENT_WIRELESS_ON                => 60;
use constant SONYPI_EVENT_WIRELESS_OFF               => 61;
use constant SONYPI_EVENT_ZOOM_IN_PRESSED            => 62;
use constant SONYPI_EVENT_ZOOM_OUT_PRESSED           => 63;
use constant SONYPI_EVENT_CD_EJECT_PRESSED           => 64;
use constant SONYPI_EVENT_MODEKEY_PRESSED            => 65;
use constant SONYPI_EVENT_PKEY_P4                    => 66;
use constant SONYPI_EVENT_PKEY_P5                    => 67;
use constant SONYPI_EVENT_SETTINGKEY_PRESSED         => 68;
use constant SONYPI_EVENT_VOLUME_INC_PRESSED         => 69;
use constant SONYPI_EVENT_VOLUME_DEC_PRESSED         => 70;
use constant SONYPI_EVENT_BRIGHTNESS_PRESSED         => 71;

our $Events = {};

sub eventLoop {
   my $dev = "/dev/sonypi";

   open(my $fd, '<', $dev) or die("listen: open: $!");
   my $rin = '';
   vec($rin, fileno($fd), 1) = 1;

   while (select($rin, undef, undef, undef)) {
      my $ret = sysread($fd, my $ev, 1);
      if ($ret == 0) {
         last;
      }
      $ev = sprintf("%s", unpack('c', $ev));
      #print "DEBUG: EVENT[$ev] RET[$ret]\n";

      if (exists $Events->{$ev}) {
         &{$Events->{$ev}}();
      }
   }

   close($fd);
}

1;

__END__

=head1 NAME

Lib::Sonypi - Perl interface to sonypi Linux kernel module

=head1 SYNOPSIS

   # For now, see examples/ directory in this archive

=head1 DESCRIPTION

=head1 FUNCTIONS TO GET VALUES

=over 4

=item B<getbat1cap> ()

=item B<getbat1rem> ()

=item B<getbat2cap> ()

=item B<getbat2rem> ()

=item B<getbatflags> ()

=item B<getblue> ()

=item B<getbrt> ()

=item B<getfan> ()

=item B<gettemp> ()

=back

=head1 FUNCTIONS TO SET VALUES

=over 4

=item B<setblue> (value)

=item B<setbrt> (value)

=item B<setfan> (value)

=back

=head1 EVENTS HANDLING

=over 4

=item B<eventLoop> ()

=back

=head1 AUTHOR

Patrice E<lt>GomoRE<gt> Auffret

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2010, Patrice E<lt>GomoRE<gt> Auffret

You may distribute this module under the terms of the Artistic license.
See LICENSE.Artistic file in the source distribution archive.

=cut
