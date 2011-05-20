
use strict;
use warnings;

BEGIN { require 5.006000; }

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Provides a convenient method for exporting a 2D piddle.',
  'AUTHOR' => 'Joel Berger <joel.a.berger@gmail.com>',
  'BUILD_REQUIRES' => {
    'Capture::Tiny' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'PDL-IO-Export2D',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'PDL::IO::Export2D',
  'PREREQ_PM' => {
    'Carp' => '0',
    'PDL' => '0',
    'Scalar::Util' => '0'
  },
  'VERSION' => '0.030',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



