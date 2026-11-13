# Raises the nginx open file limit so it handles high concurrency without failed requests
exec { 'fix--for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => '/usr/local/bin/:/bin/',
}

exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',
  path    => '/usr/sbin/:/usr/bin/:/sbin/:/bin/',
  require => Exec['fix--for-nginx'],
}
