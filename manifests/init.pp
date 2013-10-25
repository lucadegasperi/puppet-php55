class php55 {

	package { 'python-software-properties':
	  ensure => present,
	}

	exec { 'add php55 apt-repo':
	  command => "/usr/bin/add-apt-repository ppa:ondrej/php5 -y",
	  unless => "/usr/bin/dpkg-query -l 'php5' 2>/dev/null | grep -q '^i'",
	  require => Package['python-software-properties'],
	  before => Class['php'],
	  notify => Exec['update php55 apt-repo'],
	}

	exec { 'update php55 apt-repo': 
	  command => '/usr/bin/apt-get update',
	  refreshonly => true,
	}
}