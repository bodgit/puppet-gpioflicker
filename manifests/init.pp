#
class gpioflicker (
  $device,
  $pin,
  $active_time   = undef,
  $initial_state = undef,
  $package_name  = $::gpioflicker::params::package_name,
  $reversed      = false,
  $service_name  = $::gpioflicker::params::service_name,
) inherits ::gpioflicker::params {

  if $active_time {
    validate_integer($active_time)
  }
  validate_absolute_path($device)
  if $initial_state {
    validate_integer($initial_state, 1, 0)
  }
  validate_string($package_name)
  validate_integer($pin)
  validate_bool($reversed)
  validate_string($service_name)

  include ::gpioflicker::install
  include ::gpioflicker::service

  anchor { 'gpioflicker::begin': }
  anchor { 'gpioflicker::end': }

  Anchor['gpioflicker::begin'] -> Class['::gpioflicker::install']
    ~> Class['::gpioflicker::service'] -> Anchor['gpioflicker::end']
}
