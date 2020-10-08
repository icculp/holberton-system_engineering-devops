# Task 1

exec {'limits':
  command => "sudo sed -i 's,holberton hard nofile.*,holberton hard nofile 5000,' /etc/security/limits.conf",
  path    => ['/bin', '/usr/bin'],
}
exec {'limits.conf':
  command => "sudo sed -i 's,holberton soft nofile.*,holberton soft nofile 5000,' /etc/security/limits.conf",
  path    => ['/bin', '/usr/bin'],
}
