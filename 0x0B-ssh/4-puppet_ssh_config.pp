# Task 2
# Creates a file

::ssh::client::config::user { 'vagrant':
  ensure        => present,
  user_home_dir => '/home/vagrant',
  options       => {
    'PasswordAuthentication' => 'no',
    'IdentityFile'           => '~/.ssh/holberton',
  },
}
