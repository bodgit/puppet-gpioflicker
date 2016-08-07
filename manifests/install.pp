#
class gpioflicker::install {

  package { $::gpioflicker::package_name:
    ensure => present,
  }
}
