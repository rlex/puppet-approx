#Detect OS, set os-specific parameters
class approx::params {
  case $::operatingsystem {
    'ubuntu', 'debian': {
      $approx_conffile = '/etc/approx/approx.conf'
      $approx_logdir = '/var/log'
      $approx_service = 'openbsd-inetd'
      $approx_package = 'approx'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
