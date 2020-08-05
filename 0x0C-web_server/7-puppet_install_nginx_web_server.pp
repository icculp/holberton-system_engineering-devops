# Task 6
# Install Nginx
????
include nginx???



class {'nginx':

}


server {
  listen 80;
}





nginx::resource::location {"www.example.org-wiki":
  ensure             => present,
  vhost              => 'www.example.org',
  location           => '/wiki',
  redirect           => 'http://wiki.example.org'
}