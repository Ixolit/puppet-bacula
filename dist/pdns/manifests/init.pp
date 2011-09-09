# Class: pdns
#
# This class installs and configures pdns
#
# Parameters:
#
# Actions:
#
# Requires:
#   - The pdns::params class
#
# Sample Usage:
#
class pdns {
  include pdns::params
  include pdns::nagios

  $mirror0 = $pdns::params::mirror0
  $mirror1 = $pdns::params::mirror1
  $mirror2 = $pdns::params::mirror2

  package { $pdns::params::package_list:
    ensure => present,
  }

  service { $pdns::params::service_list:
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package[$pdns::params::package_list],
  }

  File { owner => "$pdns::params::user", group => "$pdns::params::group" }

  # Get the ruby-pdns gem
  exec { "download ruby-pdns gem":
    command => "/usr/bin/wget http://ruby-pdns.googlecode.com/files/ruby-pdns-0.5.1.gem",
    cwd     => "/usr/local/src",
    creates => "/usr/local/src/ruby-pdns-0.5.1.gem";
  }

  # Install the ruby-pdns gem from the local disk
  package { "ruby-pdns":
    ensure   => installed,
    source   => "/usr/local/src/ruby-pdns-0.5.1.gem",
    require  => Exec["download ruby-pdns gem"],
    provider => gem,
  }

  # needed on debian for net-geoip
  package { "zlib1g-dev": ensure  => installed; }
  # needed on debian, but not on ubuntu, no idea why
  package { "net-geoip": ensure => installed, provider => gem; }
  # because: /var/lib/gems/1.8/gems/ruby-pdns-0.5.1/sbin/pdns-pipe-runner.rb
  # contains conffile to /etc/pdns, when it doesn't exist, but the file
  # needed is in /etc/powerdns
  # MAY be debubntu specific
  file { "/etc/pdns":
    ensure => link,
    target => "/etc/powerdns";
  }

  # This should be a package and not a file in the module
  file { '/var/lib/GeoIP/GeoIP.dat':
    source => 'puppet:///modules/pdns/GeoIP.dat',
    ensure => present,
  }

  file { "$pdns::params::conf_dir/pdns-ruby-backend.cfg":
    source  => 'puppet:///modules/pdns/pdns-ruby-backend.cfg',
    ensure  => present,
    require => Package[$pdns::params::package_list],
  }

  file { "$pdns::params::conf_dir/pdns.d/pipe.conf":
    content => template('pdns/pipe.conf.erb'),
    ensure  => present,
    require => Package[$pdns::params::package_list],
  }

  file { "$pdns::params::conf_dir/records/docs.prb":
    content => template('pdns/docs.prb.erb'),
    ensure  => present,
    require => Package[$pdns::params::package_list],
  }

  file { [ "$pdns::params::log_dir", "$pdns::params::stats_dir", "$pdns::params::conf_dir/records" ]:
    ensure  => directory,
    require => Package[$pdns::params::package_list],
  }

  @firewall {
    '0053-INPUT ACCEPT 53 udp':
      jump  => 'ACCEPT',
      dport => "53",
      proto => 'udp',
  }

  @firewall {
    '0053-INPUT ACCEPT 53 tcp':
      jump  => 'ACCEPT',
      dport => "53",
      proto => 'tcp',
  }

}
