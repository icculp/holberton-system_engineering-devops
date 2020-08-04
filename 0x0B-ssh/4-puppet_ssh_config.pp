# Task 2
# Creates a file

class { 'ssh::server':
  options           => {
    'PasswordAuthentication' => 'no',
    'IdentityFile'           => '~/.ssh/holberton',
  },
}
