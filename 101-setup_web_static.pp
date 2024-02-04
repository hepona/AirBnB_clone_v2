#task 0 in puppet
package {'apt':
  ensure => 'installed',
}

exec { 'apt-update':
  command => '/usr/bin/apt update',
}

exec { 'install_nginx':
  command => '/usr/bin/apt install -y nginx',
}

file { '/data/web_static/releases/test':
  ensure => directory,
  recurse => true,
}

file { '/data/web_static/shared':
  ensure => directory,
}

file { '/data/web_static/releases/test/index.html':
  content => "<html>
    <head>
    </head>
    <body>
      Holberton School
    </body>
  </html>",
}

file { '/data/web_static/current':
  ensure => link,
  target => '/data/web_static/releases/test',
}

file { '/data':
  ensure => directory,
  recurse => true,
  owner  => 'ubuntu',
  group  => 'ubuntu',
}

file { '/etc/nginx/sites-available/default':
  content => "server {
    location /hbnb_static/ {
        alias /data/web_static/current/;
    }
}",
}

exec { 'restart_nginx':
  command => '/usr/sbin/service nginx restart',
}
