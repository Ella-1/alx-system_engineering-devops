# Install a package using Puppet

exec { 'pip3 install flask':
  command => '/usr/bin/pip3 install flask'
}

exec { 'pip3 install puppet-lint':
  command => '/usr/bin/pip3 install flask -v 2.1.0'
}

package { 'flask':
  ensure => 'installed',
  before => Exec['pip3 install flask']
}

package { 'puppet-lint':
  ensure  => 'installed',
  before  => Exec['install puppet-lint'],
  require => Package['flask']
}
