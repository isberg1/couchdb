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
    before   => Apt::Key['couchdb_key'],
  }

  # Installs curl.
  package { 'curl':
    ensure => installed,
  }

  apt::key { 'couchdb_key':
    id     => '8756C4F765C9AC3CB6B85D62379CE192D401AB61',
    server => 'pgp.mit.edu',
    before => Exec['update_apt'],
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
