# Task 2
# comment

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

file {'/var/www/error/custom_404.html':
  ensure  => present,
  content => "Ceci n'est pas une page\n",
}

$s = "server {
        listen 80 default_server;
        listen [::]:80 default_server;
        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;
        add_header X-Served-By ${hostname};
        error_page 404 /custom_404.html;
        location = /custom_404.html {
                root /var/www/error;
                internal;
        }
}"

file {'/etc/nginx/sites-available/default':
  ensure  => present,
  path    => '/etc/nginx/sites-available/default',
  content => "${s} ",
}

service {'nginx':
  ensure  => running,
  restart => 'sudo service nginx restart',
}
