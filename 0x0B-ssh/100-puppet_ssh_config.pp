file { '/etc/ssh/ssh_config':
  ensure  => file,
  mode    => '0644',
  content => template('ssh_config/ssh_config.erb'),
}

file_line { 'Turn off passwd auth':
  path => '/etc/ssh/ssh_config',
  line => 'PasswordAuthentication no',
  match => '^#PasswordAuthentication',
  notify => Service['ssh'],
}

file_line { 'Declare identity file':
  path => '/etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/school',
  match => '^#IdentityFile',
  notify => Service['ssh'],
}

service { 'ssh':
  ensure => running,
  enable => true,
  name   => 'ssh',
}
