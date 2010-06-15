#
# $Id: Makefile.PL 3 2010-06-13 16:45:23Z gomor $
#
use ExtUtils::MakeMaker;

WriteMakefile(
   NAME          => 'Lib::Sonypi',
   VERSION_FROM  => 'lib/Lib/Sonypi.pm',
   LICENSE       => 'artistic',
   ABSTRACT_FROM => 'lib/Lib/Sonypi.pm',
   AUTHOR        => 'GomoR <gomor-cpan_at_gomor.org>',
   #EXE_FILES     => [ @{[glob('bin/*.pl')]} ],
   #PREREQ_PM     => {
      #Class::Gomor => 0,
   #},
);
