# Install Nginx web server with Puppet
include stdlib

$link = 'https://www.youtube.com/watch?v=QH2-TGUlwu4'
$content = "\trewrite ^/redirect_me/$ ${link} permanent;"

exec { 'update packages':
  command => '/usr/bin/apt-get update'
}

exec { 'restart nginx':
  command => '/usr/sbin/service nginx restart',
  require => Package['nginx']
}

package { 'nginx':
  ensure  => 'installed',
  require => Exec['update packages']
}

