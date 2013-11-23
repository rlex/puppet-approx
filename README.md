### DESCRIPTION

This is module for managing approx apt proxy mirror.  
It supports every single option you can find in original config.

### DEPENDENCIES
* puppet >= 2.6
* puppetlabs/concat >= 1.0.0

### BASIC CLASS
Will install approx with default options and without any mirrors.  
Can be customized with following:

```puppet
class { 'approx':
  cache => "/srv/approx/",
  max_rate => 10,
  max_redirects => 10,
  user => approx,
  group => approx,
  syslog => daemon,
  pdiffs => true,
  offline => false,
  max_wait => 10,
  verbose => false,
  debug => false,
}
```
All params except $cache is optional and undefined by default.

### MIRROR CLASS
Will setup new mirror with specified origin.  
Can be used several times for specifying several mirrors.

```puppet
  approx::mirror { 'debian':
    origin => 'ftp://mirror.hetzner.de/debian'
  }
```
