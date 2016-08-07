#
class gpioflicker::service {

  $flags = join(delete_undef_values([
    "-d ${::gpioflicker::device}",
    "-p ${::gpioflicker::pin}",
    $::gpioflicker::initial_state ? {
      undef   => undef,
      default => "-I ${::gpioflicker::initial_state",
    },
    $::gpioflicker::reversed ? {
      true    => '-r',
      default => undef,
    },
    $::gpioflicker::active_time ? {
      undef   => undef,
      default => "-t ${::gpioflicker::active_time",
    },
  ]), ' ')

  service { $::gpioflicker::service_name:
    ensure     => running,
    enable     => true,
    flags      => $flags,
    hasrestart => true,
    hasstatus  => true,
  }
}
