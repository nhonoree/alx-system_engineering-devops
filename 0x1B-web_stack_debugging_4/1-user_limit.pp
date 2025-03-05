# This Puppet manifest ensures the holberton user exists and increases the open file limit.

# Ensure the holberton user exists
user { 'holberton':
  ensure => present,
  shell  => '/bin/bash',
}

# Set the open file limit for the holberton user
exec { 'increase_holberton_file_limit':
  command => 'echo "holberton soft nofile 65536" >> /etc/security/limits.conf && \
              echo "holberton hard nofile 65536" >> /etc/security/limits.conf',
  path    => ['/bin', '/usr/bin'],
  unless  => 'grep -q "holberton soft nofile 65536" /etc/security/limits.conf',
  require => User['holberton'],
}

# Ensure the changes take effect
exec { 'apply_limits':
  command     => 'sysctl -p',
  path        => ['/sbin', '/usr/sbin'],
  refreshonly => true,
  subscribe   => Exec['increase_holberton_file_limit'],
}
