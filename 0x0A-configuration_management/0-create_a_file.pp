# Task 0
# Creates a file

file { '/tmp/holberton':
  path    => '/tmp/holberton',
  group   => 'www-data',
  owner   => 'www-data',
  mode    => '0744',
  content => 'I love Puppet',
}
