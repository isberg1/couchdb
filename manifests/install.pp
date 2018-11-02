# This class installs couchdb.

class couchdb::install {

  # Adds the repository of couchdb.
  apt::source { 'apache_couchdb':
    location => 'https://apache.bintray.com/couchdb-deb',
    repos    => 'main',
    include  => {
      'deb' => true,
    },
    before   => Apt::Key['couchdb_key'],
  }

  # Adds the key for the repository.
  apt::key { 'couchdb_key':
    id     => '8756C4F765C9AC3CB6B85D62379CE192D401AB61',
    server => 'pgp.mit.edu',
    before => Class['apt::update'],
  }

  # Installs curl.
  package { 'curl':
    ensure => installed,
  }

  # Updates all repositories.
  Class['apt::update'] -> Package <| provider == 'apt' |>

  # Installs the couchdb package.
  package { 'couchdb':
    ensure  => installed,
    require => Class['apt::update'],
  }
}
