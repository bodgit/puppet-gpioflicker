#
class gpioflicker::params {

  case $::osfamily {
    'OpenBSD': {
      $package_name = 'gpioflicker'
      $service_name = 'gpioflicker'
    }
    default: {
      fail("The ${module_name} module is not supported on ${::osfamily} based systems.") # lint:ignore:80chars
    }
  }
}
