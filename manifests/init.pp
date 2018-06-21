# Manage gpioflicker.
#
# @example Declaring the class
#   class { '::gpioflicker':
#     device => '/dev/gpio1',
#     pin    => 0,
#   }
#
# @param active_time
# @param device
# @param initial_state
# @param package_name
# @param pin
# @param reversed
# @param service_name
#
# @since 1.0.0
class gpioflicker (
  Stdlib::Absolutepath    $device,
  Integer[0]              $pin,
  Optional[Integer[0]]    $active_time   = undef,
  Optional[Integer[0, 1]] $initial_state = undef,
  String                  $package_name  = $::gpioflicker::params::package_name,
  Boolean                 $reversed      = false,
  String                  $service_name  = $::gpioflicker::params::service_name,
) inherits ::gpioflicker::params {

  contain ::gpioflicker::install
  contain ::gpioflicker::config
  contain ::gpioflicker::service

  Class['::gpioflicker::install'] -> Class['::gpioflicker::config']
    ~> Class['::gpioflicker::service']
}
