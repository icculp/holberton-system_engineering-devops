# Task 4
# Creates a file
file_line { 'PasswordAuthentication':
  path    => '~/.ssh/ssh_config',
  replace => true,
  line    => 'PasswordAuthentication no',
  match   => 'PasswordAuthentication'
}

file_line { 'IdentityFile':
    path    => '~/.ssh/ssh_config',
    replace => true,
    line    => 'IdentityFile ~/.ssh/holberton',
    match   => 'IdentityFile',
  }
