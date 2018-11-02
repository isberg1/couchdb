# This class installs couchdb.

class couchdb::install {

  # Includes apt and runs the configuration settings from hiera.
  include apt

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
