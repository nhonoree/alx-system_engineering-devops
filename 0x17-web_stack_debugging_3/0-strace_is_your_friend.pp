# 0-strace_is_your_friend.pp
# Fix file permissions for Apache to resolve 500 error.

exec { 'fix-apache-permissions':
  command => '/bin/chown -R www-data:www-data /var/www/html',
  onlyif  => '/usr/bin/test -d /var/www/html',
  notify  => Service['apache2'],
}

service { 'apache2':
  ensure => running,
  enable => true,
}
