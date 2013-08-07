# == Class: megaraid::params
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
class megaraid::params {
  if $::osfamily != 'redhat' {
    fail("Module ${module_name} is not supported on ${::operatingsystem}")
  }

  $msm_pkg = [
    'Lib_Utils',
    'Lib_Utils2',
    'MegaRAID_Storage_Manager',
    'sas_ir_snmp',
    'sas_snmp'
  ]
  $megacli_pkg = 'MegaCli'

  case $::architecture {
    'x86_64' : { $megacli_path = '/opt/MegaRAID/MegaCli/MegaCli64' }
    'i386'   : { $megacli_path = '/opt/MegaRAID/MegaCli/MegaCli' }
    default  : {
      fail("Module ${module_name} is not supported on ${::architecture}")
    }
  }
}
