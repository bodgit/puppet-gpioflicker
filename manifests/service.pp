# @!visibility private
class gpioflicker::service {

  service { $::gpioflicker::service_name:
    ensure     => running,
    enable     => true,
    flags      => $::gpioflicker::config::flags,
    hasstatus  => true,
    hasrestart => true,
  }
}
