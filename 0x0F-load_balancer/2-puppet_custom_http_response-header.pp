# Task 2
# comment

exec {'apt-update':
    command => '/usr/bin/env apt-get update',
}

-> package {'nginx':
  ensure   => 'installed',
  provider => 'apt',
}

-> file {'/var/www/html/index.html':
  ensure  => present,
  content => "Holberton School\n",
}

-> file {'/var/www/error/custom_404.html':
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
	root /var/www/html;
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files \$uri \$uri/ =404;
        }
}"

file {'/etc/nginx/sites-available/default':
  ensure  => present,
  path    => '/etc/nginx/sites-available/default',
  content => "${s} ",
}

-> service {'nginx':
  ensure  => running,
  restart => 'sudo service nginx restart',
}
