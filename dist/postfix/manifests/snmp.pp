class postfix::snmp {
  include ::snmp
  include postfix
  # track check_ports.conf changes 
  file {'fetch_mail_statistics.pl':
    name     => '/usr/local/sbin/fetch_mail_statistics.pl',
    ensure   => present,
    replace  => true,
    owner    => 'root',                        
    group    => 'root',
    mode     => '0700',
    source   => 'puppet:///modules/postfix/fetch_mail_statistics.pl',
    require  => Package['postfix'],
  }
  fragment{'postfix-snmp':
    order     => '99',
    filename  => '/etc/snmp/snmpd.conf',
    source    => 'puppet:///modules/postfix/snmpd.conf',
    require   => Package['net-snmp'],
  }
}