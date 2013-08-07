# == Class: megaraid
#
# installs various LSI MegaRAID RAID controller related management software
#
# Add this module to a manifest is equivalent to manually including these
# classes: 
#
#    `megaraid::msm`
#    `megaraid::megacli`
#    `megaraid::lsiget`
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

  # sequence doesn't actually matter
  class{ 'megaraid::msm': } ->
  class{ 'megaraid::megacli': } ->
  class{ 'megaraid::lsiget': } ->
  Class[ 'megaraid' ]
}
