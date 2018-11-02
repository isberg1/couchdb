# Example of use with parameters.
#
# Specify the folder to hold the couchDB data, this folder wil be created.
# Allows couchDB to listen on all addresses.
# Binds the port to 5050
# Creates a admin password, in doing so it removes 'admin party'.

node default {
  class {'couchdb':
    bind_address   => '0.0.0.0',
    port           => 5050,
    admin_password => 'MySecretPassword',
  }
}
