# This Puppet script configures the SSH client to use the private key ~/.ssh/school
# and disables password authentication.

file_line { 'Turn off passwd auth':
  path => '/etc/ssh/ssh_config',
  line => 'PasswordAuthentication no',
  match => '^PasswordAuthentication',
}

file_line { 'Declare identity file':
  path => '/etc/ssh/ssh_config',
  line => 'IdentityFile ~/.ssh/school',
  match => '^IdentityFile',
}
