# This Puppet manifest ensures Nginx is installed, increases the worker connections limit, and fixes the configuration.

# Ensure Nginx is installed
package { 'nginx':
  ensure => installed,
}

# Fix Nginx configuration (example: ensure the default server block is correct)
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => "
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html index.htm;

    server_name _;

    location / {
        try_files \$uri \$uri/ =404;
    }
}
",
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Increase Nginx worker connections
exec { 'increase_nginx_worker_connections':
  command => "sed -i 's/worker_connections.*/worker_connections 4096;/' /etc/nginx/nginx.conf",
  path    => ['/bin', '/usr/bin'],
  onlyif  => 'grep -q "worker_connections" /etc/nginx/nginx.conf',
  require => Package['nginx'],
  notify  => Service['nginx'],
}

# Ensure Nginx service is running
service { 'nginx':
  ensure => running,
  enable => true,
  hasstatus => true,
  hasrestart => true,
  require => Package['nginx'],
}
