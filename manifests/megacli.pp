# == Class: megaraid::megacli
#
# installs the package(s) that provide the `MegaCLI` utility
#
#
# === Parameters
#
# Accepts no parameters.
#
#
# === Examples
#
#    class{ 'megaraid::megacli': }
#
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#
class megaraid::megacli inherits megaraid::params {

  package { $megaraid::params::megacli_pkg:
    ensure  => present,
  }

  $cli = $megaraid::params::megacli_path
  $priority = 1
  $bin = 'MegaCli'

  exec { "alternatives --install /usr/bin/${bin} ${bin} ${cli} ${priority}":
    path   => '/bin:/sbin:/usr/bin:/usr/sbin',
    unless => "test /etc/alternatives/${bin} -ef ${cli}"
  } -> exec { "alternatives --set ${bin} ${cli}":
    path   => '/bin:/sbin:/usr/bin:/usr/sbin',
    unless => "test /etc/alternatives/${bin} -ef ${cli}"
  }
}
