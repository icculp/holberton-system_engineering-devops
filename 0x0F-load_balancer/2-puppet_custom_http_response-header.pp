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
        error_page 404 /custom_404.html
        location = /custom_404.html {
                root /var/www/error;
                internal;
                add_header X-Served-By \$hostname;
        root /var/www/html
}"

file {'/etc/nginx/sites-available/default':
  ensure  => present,
  path    => '/etc/nginx/sites-available/default',
  content => '$s',
}
