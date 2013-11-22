#Primary class with options
class approx (
  $cache = undef,
  $max_rate = undef,
  $max_redirects = undef,
  $user = undef,
  $group = undef,
  $syslog = undef,
  $pdiffs = undef,
  $offline = undef,
  $max_wait = undef,
  $verbose = undef,
  $debug = undef,
) {
  include approx::params
  include concat::setup

  # Localize some variables
  $approx_package     = $approx::params::approx_package
  $approx_conffile     = $approx::params::approx_conffile
  $approx_logdir      = $approx::params::approx_logdir
  $approx_service     = $approx::params::approx_service

  package { $approx_package:
    ensure   => installed,
    provider => $::provider,
  }

  service { $approx_service:
    ensure    => running,
    name      => $approx_service,
    enable    => true,
    require   => Package[$approx_package],
  }

  concat::fragment { 'approx-header':
    order   => '00',
    target  => $approx_conffile,
    content => template('approx/approx.conf.erb'),
    require => Package[$approx_package],
  }

  concat { $approx_conffile:
    notify  => Service[$approx_service],
    require => Package[$approx_package],
  }

}

