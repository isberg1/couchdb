# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include couchdb::config
class couchdb::config {

  ini_setting { 'database_dir':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.d/couchdb.ini',
    section => 'couchdb',
    setting => 'database_dir',
    value   => $::database_dir,
  }

  ini_setting { 'file_compression':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.d/couchdb.ini',
    section => 'couchdb',
    setting => 'file_compression',
    value   => $::file_compression,
  }

  ini_setting { 'max_dbs_open':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.d/couchdb.ini',
    section => 'couchdb',
    setting => 'max_dbs_open',
    value   => $::max_dbs_open,
  }

  if $::uuid != '' {
    ini_setting { 'uuid':
      ensure  => present,
      path    => '/opt/couchdb/etc/local.d/couchdb.ini',
      section => 'couchdb',
      setting => 'couchdb',
      value   => $::uuid,
    }
  }

  if $::max_document_size != '' {
    ini_setting { 'max_document_id_length':
      ensure  => present,
      path    => '/opt/couchdb/etc/local.d/couchdb.ini',
      section => 'couchdb',
      setting => 'max_document_size',
      value   => $::max_document_size,
    }

  }

  ini_setting { 'couch_peruser_enable':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.d/couch_peruser.ini',
    section => 'couch_peruser',
    setting => 'enable',
    value   => $::couch_peruser_enable,
  }

  ini_setting { 'delete_dbs':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.d/couch_peruser.ini',
    section => 'couch_peruser',
    setting => 'delete_dbs',
    value   => $::delete_dbs,
  }

  ini_setting { 'default_security':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.d/couchdb.ini',
    section => 'couchdb',
    setting => 'default_security',
    value   => $::default_security,
  }

  ini_setting { 'bind_address':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.d/chttpd.ini',
    section => 'chttpd',
    setting => 'bind_address',
    value   => $::bind_address,
  }

  ini_setting { 'port':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.d/chttpd.ini',
    section => 'chttpd',
    setting => 'port',
    value   => $::port,
  }

  ini_setting { 'admin':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.d/admins.ini',
    section => 'admins',
    setting => 'admin',
    value   => $::admin,
  }

  ini_setting { 'allow_persistent_cookies':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.d/couch_httpd_auth.ini',
    section => 'couch_httpd_auth',
    setting => 'allow_persistent_cookies',
    value   => $::allow_persistent_cookies,
  }

  ini_setting { 'require_valid_user':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.d/chttpd.ini',
    section => 'chttpd',
    setting => 'require_valid_user',
    value   => $::require_valid_user,
  }

}
