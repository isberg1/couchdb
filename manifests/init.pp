# Puppet module for installing CouchDB.
#
# Main class, contains all other classes.
# All parameters are optional. CouchDB wil supply its config-file with
# default options if none is specified.
#
#
# @param file_compression
#	Method used to compress everything that is appended to database and view index files, except for attachments.
#	Available methods are:
#	  - none:      no compression
#	  - snappy:    use Google Snappy, a very fast compressor/decompressor
#	  - deflate_N: use zlib’s deflate; N is the compression level which ranges from
#		1 (fastest, lowest compression ratio) to 9 (slowest, highest compression ratio)
#
#
# @param max_dbs_open
#	This option places an upper bound on the number of databases that can be open at once.
#
#
# @param max_document_size
#	Limit maximum document body size.
#
#
# @param couch_peruser_enable
#	If set to 'true', couch_peruser ensures that a private per-user database exists for each document in _users.
#
#
# @param couch_peruser_delete
#   If set to 'true' and a user is deleted, the respective database gets deleted as well.
#
#
# @param default_security
#	Default security object for databases, available options is:
#	  - everyone:    Anyone can perform reads and writes.
#	  - admin_only:  Only admins can read and write.
#	  - admin_local: Sharded databases can be read and written by anyone but the
#		shards can only be read and written by admins.
#
#
# @param require_valid_user
#	When set to 'true', no requests are allowed from anonymous users.
#	Everyone must be authenticated.
#
#
# @param bind_address
#	Defines the IP address by which the clustered port is available.
#
#
# @param port
#	Defines the port number to listen.
#
#
# @param admin_password
#	Enables the admin account and sets the admin password.
#	This crashes the 'admin party' (everyone is a admin).
#
#
# @param allow_persistent_cookies
#	Makes cookies persistent if set to 'true'.
#

class couchdb (
  # Available parameters:
  Optional[Variant[Enum['none', 'snappy'], Pattern[/\Adeflate_[1-9]\z/]]] $file_compression,
  Optional[Integer] $max_dbs_open,
  Optional[Integer] $max_document_size,
  Optional[Boolean] $couch_peruser_enable,
  Optional[Boolean] $couch_peruser_delete,
  Optional[Enum[everyone, admin_only, admin_local]] $default_security,
  Optional[String] $bind_address,
  Optional[Integer] $port,
  Optional[String] $admin_password,
  Optional[Boolean] $allow_persistent_cookies,
  Optional[Boolean] $require_valid_user,

) {
  # Contains install and config, install runs before config.
  contain couchdb::install

  class { 'couchdb::config':
    service { 'couchdb':
      ensure => running,
      subscribe Class['couchdb::config']
    },
    require => Class['couchdb::install'],
  }

}
