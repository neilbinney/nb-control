# Manage iptables/firewall rules
# Uses puppetlabs-firewall forge module
class profile::hardening::rhel6::firewall {

  File {
    owner => root,
    group => root,
    mode  => '0400',
  }

  #### Write firewall rules dynamically using the puppetlabs/firewall class

  # Turn purging off by default.  Enable it per firewallchain when defining
  # A true value here will override and ignore purge and ignore settings
  # in the firewallchain definitions.
  resources { 'firewall':
    purge => false,
  }

  # set defaults so that new rules fall between the pre and post stuff.
  Firewall {
    before  => Class['profile::hardening::rhel6::firewall::post'],
    require => Class['profile::hardening::rhel6::firewall::pre'],
  }

  class { [
    'profile::hardening::rhel6::firewall::pre',
    #'profile::hardening::rhel6::firewall::rules',
    'profile::hardening::rhel6::firewall::post'
    ]:
  }

  class { '::firewall': }

}
