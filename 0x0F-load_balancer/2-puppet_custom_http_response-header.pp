exec {'apt-update':
    command => '/usr/bin/apt-get update',
}

package {'nginx':
  ensure => latest,
}

file {'/var/www/html/index.html':
  ensure  => present,
  content => 'Holberton School',
}

$s = "server {
        listen 80 default_server;
        listen [::]:80 default_server;
        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
        add_header X-Served-By ${hostname};
}"

file {'/etc/nginx/sites-available/default':
  ensure  => present,
  path    => '/etc/nginx/sites-available/default',
  content => "${s} ",
}
