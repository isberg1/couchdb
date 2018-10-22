# Depends on 'puppetlabs-stdlib --version 5.1.0'
# $ puppet module install puppetlabs-stdlib --version 5.1.0

node default {
  file { '/etc/apt/sources.list':
    ensure  => present,
    # This source file would be located on the Puppet master at
    # /etc/puppetlabs/code/modules/ntp/files/ntp.conf
  }

  $str = 'deb https://apache.bintray.com/couchdb-deb bionic main'
  file_line { 'edit_apt_sourelist':
    ensure  => present,
    line    =>  $str,
    path    => '/etc/apt/sources.list',
    require => File['/etc/apt/sources.list'],
  }

  # ecrypted file cannot edit manualy
  exec {'add_key':
    command => 'curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc  | sudo apt-key add -',
    path    => ['/usr/bin/'],
    require => File_line['edit_apt_sourelist'],
  }

  exec {'update_apt':
    command => '/usr/bin/apt-get update',
    require => Exec['add_key'],
  }

  package { 'couchdb':
    ensure   => installed,
    #install_options      => # An array of additional options to pass when..
  }

  package { 'curl':
    ensure => '7.58.0-2ubuntu3.1',
  }


}
