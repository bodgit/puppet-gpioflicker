# @!visibility private
class gpioflicker::params {

  case $::facts['os']['family'] {
    'OpenBSD': {
      $package_name = 'gpioflicker'
      $service_name = 'gpioflicker'
    }
    default: {
      fail("The ${module_name} module is not supported on ${::facts['os']['family']} based systems.")
    }
  }
}
