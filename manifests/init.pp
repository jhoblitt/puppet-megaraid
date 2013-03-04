# == Class: megaraid_sm
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
#    class{ 'megaraid_sm': }
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

class megaraid_sm {
  if $::osfamily != 'redhat' {
    fail("Module ${module_name} is not supported on ${::operatingsystem}")
  }

  class{ 'megaraid_sm::install': } ->
  class{ 'megaraid_sm::service': } ->
  Class[ 'megaraid_sm' ]
}
