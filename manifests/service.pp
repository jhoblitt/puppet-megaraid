class megaraid_sm::service {
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
