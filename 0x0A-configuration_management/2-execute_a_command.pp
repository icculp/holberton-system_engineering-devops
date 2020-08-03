# Task 2
# Creates a file

exec { 'pkill killmenow':
  command   => '/usr/bin/pkill killmenow',
}
