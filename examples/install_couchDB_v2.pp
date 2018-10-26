# Testint the installation of couchDB
# Needs: puppet module install puppetlabs-apt --version 6.1.1
#

node default {
  # Adds the repository of couchdb.
  apt::source { 'apache_couchdb':
    location => 'https://apache.bintray.com/couchdb-deb',
    repos    => 'main',
    include  => {
      'deb' => true,
    },
    before => Package['curl'],
  }

  # Installs curl.
  package { 'curl':
    ensure => installed,
    before => Exec['add_key'],
  }

# Adds the PPA key.
  exec {'add_key':
    command => 'curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc  | sudo apt-key add -',
    path    => ['/usr/bin/'],
    require => Package['curl'],
    before  => Exec['update_apt'],
  }

# Updates all repositories.
  exec {'update_apt':
    command => '/usr/bin/apt-get update',
    before  => Package['couchdb'],
  }

  # Installs the couchdb package.
  package { 'couchdb':
    ensure   => installed,
  }
}