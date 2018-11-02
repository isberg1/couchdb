
# couchdb

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with couchdb](#setup)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - Available parameters](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Description

The couchdb module installs and configures a CouchDB single-node-instance.

## Setup
To install couchdb with the default paramters, declare the `couchdb` class.

```puppet
include couchdb
```

## Usage

Let CouchDB listen on any available IP addresses:
```puppet
class {'couchdb':
  bind_address => '0.0.0.0',
}
```

Disable 'admin party' and set a password for the admin account:
```puppet
class {'couchdb':
  admin_password => 'MySecretPassword',
}
```

For more configuration examples, se the [reference section below](#reference)

## Reference

### The couchdb class accepts these parameters, all of which are optional.    

Parameter: `$file_compression`

Method used to compress everything that is appended to the database and view index files, except for attachments.    
Data type: `Enum/Pattern`
Available options:    
 * none
 * snappy
 * deflate_1 - deflate_9

***

Parameter: `$max_dbs_open`

This option places an upper bound on the number of databases that can be open at once.    
Data type: `Ìnteger`

***

Parameter: `$max_document_size`

Limit maximum document body size.    
Data type: Integer

***

Parameter: `$couch_peruser_enable`

If set to 'true', couch_peruser ensures that a private per-user database exists for each document in \_users.    
Data type: `Boolean`    
Available options:    
 * true
 * false

***

Parameter: `$couch_peruser_delete`

If set to 'true' and a user is deleted, the respective database gets deleted as well.    
Data type: `Boolean`    
Available options:    
 * true
 * false

***

Parameter: `$default_security`

Default security object for databases.    
Data type: `Enum`    
Available options:    
 * everyone - (Anyone can perform reads and writes)
 * admin_only - (Only admins can read and write)
 * admin_local - (Sharded databases can be read and written by anyone but the shards can only be read and written by admins)

***

Parameter: `$require_valid_user`

When set to 'true', no requests are allowed from anonymous users. Everyone must be authenticated.    
Data type: `Boolean`    
Available options:    
 * true
 * false

***

Parameter: `$bind_address`

Defines the IP address by which the clustered port is available.    
Data type: `String`

***

Parameter: `$port`

Defines the port number to listen.    
Data type: `Integer`

***

Parameter: `$admin_password`

Enables the admin account and sets the admin password. This crashes the 'admin party' (everyone is a admin).    
Data type: `String`

***

Parameter: `$allow_persistent_cookies`

Makes cookies persistent if set to 'true'.    
Data type: `Boolean`    
Available options:    
 * true
 * false


## Limitations

This module runs on Ubuntu 18.04.
