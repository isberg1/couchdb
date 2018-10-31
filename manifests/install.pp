# This class installs couchdb.

class couchdb::install {

  # Includes apt module.
  include apt

  # Adds the repository of couchdb.
  apt::source { 'apache_couchdb':
    location => 'https://apache.bintray.com/couchdb-deb',
    repos    => 'main',
    include  => {
      'deb' => true,
    },
    before   => Exec['update_apt'],
  }

  # Installs curl.
  package { 'curl':
    ensure => installed,
  }

  # Adds the PPA key.
  exec {'add_key':
    command => 'wget -q https://couchdb.apache.org/repo/bintray-pubkey.asc -O /tmp/key;apt-key add /tmp/key;rm /tmp/key',
    path    => ['/usr/bin', '/bin', '/sbin'],
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
