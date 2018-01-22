# Firewall rules to be added at the end after all other rules
# have been configured
class profile::hardening::rhel6::firewall::post {

  Firewall {
    before => undef,
  }

#  firewall { '998 Keep existing sessions going':
#    chain  => 'RH-Firewall-1-INPUT',
#    state  => ['ESTABLISHED'],
#    action => 'accept',
#  }

#  firewall { '999 Drop everything else':
#    chain => 'RH-Firewall-1-INPUT',
#    jump  => 'LOGDROP',
#  }

  firewall { '999 drop all':
    proto  => 'all',
    action => 'drop',
  }
}

}
