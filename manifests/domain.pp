# Create an approx domains.
define approx::mirror (
  $origin,
) {
  include approx::params

  $approx_conffile = $approx::params::approx_conffile

  concat::fragment { "approx-mirror-${name}":
    order   => '01',
    target  => $approx_conffile,
    content => template('approx/mirror.erb'),
  }

}
