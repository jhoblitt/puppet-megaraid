# == Class: megaraid
#
# installs the LSI MegaRAID Storage Manager and MegaCLI RAID controller
# management software
#
#
# === Parameters
#
# Accepts no parameters.
#
#
# === Examples
#
#    class{ 'megaraid': }
#
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class megaraid {
  if $::osfamily != 'redhat' {
    fail("Module ${module_name} is not supported on ${::operatingsystem}")
  }

  class{ 'megaraid::install': } ->
  class{ 'megaraid::service': } ->
  Class[ 'megaraid' ]
}
