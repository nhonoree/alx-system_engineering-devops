# This Puppet manifest adjusts the Nginx configuration to handle high traffic loads
# by increasing the worker connections and tuning other parameters.

exec { 'increase_worker_connections':
  command => "sed -i 's/worker_connections 768;/worker_connections 4096;/' /etc/nginx/nginx.conf",
  path    => ['/bin', '/usr/bin'],
  onlyif  => "grep -q 'worker_connections 768;' /etc/nginx/nginx.conf",
}

exec { 'increase_worker_rlimit_nofile':
  command => "sed -i 's/# worker_rlimit_nofile 1024;/worker_rlimit_nofile 4096;/' /etc/nginx/nginx.conf",
  path    => ['/bin', '/usr/bin'],
  onlyif  => "grep -q '# worker_rlimit_nofile 1024;' /etc/nginx/nginx.conf",
}

exec { 'restart_nginx':
  command     => 'service nginx restart',
  path        => ['/usr/sbin', '/usr/bin', '/sbin', '/bin'],
  refreshonly => true,
  subscribe   => [Exec['increase_worker_connections'], Exec['increase_worker_rlimit_nofile']],
}
