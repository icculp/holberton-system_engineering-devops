include stdlib

file_line {"wp-settings.php":
  ensure => present,
  path   => "/var/www/html/wp-settings.php",
  match  => "(.phpp)",
  line   => "require_once( ABSPATH . WPINC . '/class-wp-locale.php' );",
}
