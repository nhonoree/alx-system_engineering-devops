# Install Nginx
package { 'nginx':
  ensure => installed,
}

# Configure Nginx to add the custom header
file { '/etc/nginx/conf.d/custom_header.conf':
  ensure  => file,
  content => "add_header X-Served-By \"${::hostname}\";\n",
  require => Package['nginx'],
}

# Restart Nginx to apply the new configuration
service { 'nginx':
  ensure  => running,
  enable  => true,
  require => File['/etc/nginx/conf.d/custom_header.conf'],
}
