# gpioflicker

Tested with Travis CI

[![Build Status](https://travis-ci.com/bodgit/puppet-gpioflicker.svg?branch=master)](https://travis-ci.com/bodgit/puppet-gpioflicker)
[![Coverage Status](https://coveralls.io/repos/bodgit/puppet-gpioflicker/badge.svg?branch=master&service=github)](https://coveralls.io/github/bodgit/puppet-gpioflicker?branch=master)
[![Puppet Forge](http://img.shields.io/puppetforge/v/bodgit/gpioflicker.svg)](https://forge.puppetlabs.com/bodgit/gpioflicker)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with gpioflicker](#setup)
    * [Beginning with gpioflicker](#beginning-with-gpioflicker)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module manages gpioflicker which toggles a GPIO output (which is usually
wired to an LED) on the host every time a network packet is logged.

OpenBSD is supported using Puppet 4.5.0 or later.

## Setup

### Beginning with gpioflicker

You will need to specify the GPIO device and the pin. The below is for a
Soekris Engineering net6501 using the error LED:

```puppet
class { '::gpioflicker':
  device => '/dev/gpio1',
  pin    => 0,
}
```

## Usage

To make the LED blink for 200 milliseconds:

```puppet
class { '::gpioflicker':
  device      => '/dev/gpio1',
  pin         => 0,
  active_time => 200,
}
```

## Reference

The reference documentation is generated with
[puppet-strings](https://github.com/puppetlabs/puppet-strings) and the latest
version of the documentation is hosted at
[https://bodgit.github.io/puppet-gpioflicker/](https://bodgit.github.io/puppet-gpioflicker/).

## Limitations

This module has been built on and tested against Puppet 4.5.0 and higher.

The module has been tested on:

* OpenBSD 6.2/6.3

## Development

The module has both [rspec-puppet](http://rspec-puppet.com) and
[beaker-rspec](https://github.com/puppetlabs/beaker-rspec) tests. Run them
with:

```
$ bundle exec rake test
$ PUPPET_INSTALL_TYPE=agent PUPPET_INSTALL_VERSION=x.y.z bundle exec rake beaker:<nodeset>
```

Please log issues or pull requests at
[github](https://github.com/bodgit/puppet-gpioflicker).
