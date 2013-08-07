# == Class: megaraid::msm
#
# installs the package(s) that provide the megaraid storage manager
#
#
# === Parameters
#
# Accepts no parameters.
#
#
# === Examples
#
#    class{ 'megaraid::msm': }
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
class megaraid::msm inherits megaraid::params {
# Installing : sas_snmp-12.05-0200.x86_64                                   3/6
#Non-fatal POSTIN scriptlet failure in rpm package sas_snmp-12.05-0200.x86_64
#Can not find snmptrap in /usr/bin
#Can not continue installation of LSI SAS Agent
#Please install the net-snmp agent
#warning: %post(sas_snmp-12.05-0200.x86_64) scriptlet failed, exit status 1
# Installing : MegaCli-8.04.07-1.noarch                                     4/6
# Installing : sas_ir_snmp-12.05-0201.x86_64                                5/6
#Non-fatal POSTIN scriptlet failure in rpm package sas_ir_snmp-12.05-0201.x86_64
#Can not find snmptrap in /usr/bin
#Can not continue installation of LSI SAS-IR Agent
#Please install the net-snmp agent
#warning: %post(sas_ir_snmp-12.05-0201.x86_64) scriptlet failed, exit status 1

  # XXX this needs to be turned into a dep on another module
  package { 'net-snmp-utils':
    ensure  => present,
  }

  package { $megaraid::params::msm_pkg:
    ensure  => present,
    require => Package['net-snmp-utils'],
  }

  # service was named 'mrmonitor' in older versions
  service { 'vivaldiframeworkd':
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Package[ 'MegaRAID_Storage_Manager' ],
  }
}
