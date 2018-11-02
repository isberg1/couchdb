# This class changes the couchdb configuration.

class couchdb::config {

  ini_setting { 'file_compression':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.ini',
    section => 'couchdb',
    setting => 'file_compression',
    value   => $couchdb::file_compression,
  }

  ini_setting { 'max_dbs_open':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.ini',
    section => 'couchdb',
    setting => 'max_dbs_open',
    value   => $couchdb::max_dbs_open,
  }

  if $couchdb::max_document_size != undef {
    ini_setting { 'max_document_id_length':
      ensure  => present,
      path    => '/opt/couchdb/etc/local.ini',
      section => 'couchdb',
      setting => 'max_document_size',
      value   => $couchdb::max_document_size,
    }
  }

  ini_setting { 'default_security':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.ini',
    section => 'couchdb',
    setting => 'default_security',
    value   => $couchdb::default_security,
  }

  ini_setting { 'couch_peruser_enable':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.ini',
    section => 'couch_peruser',
    setting => 'enable',
    value   => $couchdb::couch_peruser_enable,
  }

  ini_setting { 'delete_dbs':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.ini',
    section => 'couch_peruser',
    setting => 'delete_dbs',
    value   => $couchdb::couch_peruser_delete,
  }



  ini_setting { 'bind_address':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.ini',
    section => 'chttpd',
    setting => 'bind_address',
    value   => $couchdb::bind_address,
  }

  ini_setting { 'port':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.ini',
    section => 'chttpd',
    setting => 'port',
    value   => $couchdb::port,
  }

  ini_setting { 'require_valid_user':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.ini',
    section => 'chttpd',
    setting => 'require_valid_user',
    value   => $couchdb::require_valid_user,
  }

  if $couchdb::admin_password != undef {
    ini_setting { 'admin':
      ensure  => present,
      path    => '/opt/couchdb/etc/local.ini',
      section => 'admins',
      setting => 'admin',
      value   => $couchdb::admin_password,
    }
  }

  ini_setting { 'allow_persistent_cookies':
    ensure  => present,
    path    => '/opt/couchdb/etc/local.ini',
    section => 'couch_httpd_auth',
    setting => 'allow_persistent_cookies',
    value   => $couchdb::allow_persistent_cookies,
  }


}


