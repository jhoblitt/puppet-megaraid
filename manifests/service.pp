# == Class: megaraid::service
#
# enables the megaraid storage manager service
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class megaraid::service {
  # /etc/init.d/vivaldiframeworkd sources /etc/init.d/msm_profile so there's
  # no need to enable to seperately
  #
  #  service { 'msm_profile':
  #    enable => true,
  #  }

  # service was named 'mrmonitor' in older versions
  service { 'vivaldiframeworkd':
    ensure      => running,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
  }
}
