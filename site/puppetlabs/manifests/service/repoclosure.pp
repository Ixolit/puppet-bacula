class puppetlabs::service::repoclosure {

  $mailto = "adrien@puppetlabs.com"
  # disable crons for the mean time, they're going to all fail.
  $ensure = 'absent'

  package { "yum-utils":
    ensure => present,
  }

  yumrepo {
    "repoclosure-rhel6server-x86_64-os":
      descr   => "repoclosure-rhel6server-x86_64-os",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/rhel6server-x86_64/RPMS.os/";
    "repoclosure-rhel6server-x86_64-updates":
      descr   => "repoclosure-rhel6server-x86_64-updates",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/rhel6server-x86_64/RPMS.updates/";
  }

  cron { "repoclosure rhel6server-x86_64":
    ensure => $ensure,
    command     => "repoclosure -a x86_64 -q -n -t -r repoclosure-rhel6server-x86_64-os -r repoclosure-rhel6server-x86_64-updates",
    hour        => 2,
    minute      => 0,
    environment => "MAILTO=$mailto",
    require     => Package["yum-utils"],
  }

  yumrepo {
    "repoclosure-rhel6server-i386-os":
      descr   => "repoclosure-rhel6server-i386-os",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/rhel6server-i386/RPMS.os/";
    "repoclosure-rhel6server-i386-updates":
      descr   => "repoclosure-rhel6server-i386-updates",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/rhel6server-i386/RPMS.updates/";
  }

  yumrepo {
    "repoclosure-cent6server-x86_64-os":
      descr   => "repoclosure-cent6server-x86_64-os",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/cent6server-x86_64/RPMS.os/";
    "repoclosure-cent6server-x86_64-updates":
      descr   => "repoclosure-cent6server-x86_64-updates",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/cent6server-x86_64/RPMS.updates/";
  }

  cron { "repoclosure cent6server-x86_64":
    ensure => $ensure,
    command     => "repoclosure -a x86_64 -q -n -t -r repoclosure-cent6server-x86_64-os -r repoclosure-cent6server-x86_64-updates",
    hour        => 2,
    minute      => 0,
    environment => "MAILTO=$mailto",
    require     => Package["yum-utils"],
  }

  yumrepo {
    "repoclosure-cent6server-i386-os":
      descr   => "repoclosure-cent6server-i386-os",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/cent6server-i386/RPMS.os/";
    "repoclosure-cent6server-i386-updates":
      descr   => "repoclosure-cent6server-i386-updates",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/cent6server-i386/RPMS.updates/";
  }

  cron { "repoclosure cent6server-i386":
    ensure => $ensure,
    command     => "repoclosure -q -n -t -r repoclosure-cent6server-i386-os -r repoclosure-cent6server-i386-updates",
    hour        => 2,
    minute      => 0,
    environment => "MAILTO=$mailto",
    require     => Package["yum-utils"],
  }

  yumrepo {
    "repoclosure-cent5server-x86_64-os":
      descr   => "repoclosure-cent5server-x86_64-os",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/cent5server-x86_64/RPMS.os/";
    "repoclosure-cent5server-x86_64-updates":
      descr   => "repoclosure-cent5server-x86_64-updates",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/cent5server-x86_64/RPMS.updates/";
  }

  cron { "repoclosure cent5server-x86_64":
    ensure => $ensure,
    command     => "repoclosure -a x86_64 -q -n -t -r repoclosure-cent5server-x86_64-os -r repoclosure-cent5server-x86_64-updates",
    hour        => 2,
    minute      => 0,
    environment => "MAILTO=$mailto",
    require     => Package["yum-utils"],
  }

  yumrepo {
    "repoclosure-cent5server-i386-os":
      descr   => "repoclosure-cent5server-i386-os",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/cent5server-i386/RPMS.os/";
    "repoclosure-cent5server-i386-updates":
      descr   => "repoclosure-cent5server-i386-updates",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/cent5server-i386/RPMS.updates/";
  }

  cron { "repoclosure cent5server-i386":
    ensure => $ensure,
    command     => "repoclosure -q -n -t -r repoclosure-cent5server-i386-os -r repoclosure-cent5server-i386-updates",
    hour        => 2,
    minute      => 0,
    environment => "MAILTO=$mailto",
    require     => Package["yum-utils"],
  }

  yumrepo {
    "repoclosure-rhel5server-x86_64-os":
      descr   => "repoclosure-rhel5server-x86_64-os",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/rhel5server-x86_64/RPMS.os/";
    "repoclosure-rhel5server-x86_64-updates":
      descr   => "repoclosure-rhel5server-x86_64-updates",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/rhel5server-x86_64/RPMS.updates/";
  }

  cron { "repoclosure rhel5server-x86_64":
    ensure => $ensure,
    command     => "repoclosure -a x86_64 -q -n -t -r repoclosure-rhel5server-x86_64-os -r repoclosure-rhel5server-x86_64-updates",
    hour        => 2,
    minute      => 0,
    environment => "MAILTO=$mailto",
    require     => Package["yum-utils"],
  }

  yumrepo {
    "repoclosure-rhel5server-i386-os":
      descr   => "repoclosure-rhel5server-i386-os",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/rhel5server-i386/RPMS.os/";
    "repoclosure-rhel5server-i386-updates":
      descr   => "repoclosure-rhel5server-i386-updates",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/rhel5server-i386/RPMS.updates/";
  }

  cron { "repoclosure rhel5server-i386":
    ensure => $ensure,
    command     => "repoclosure -q -n -t -r repoclosure-rhel5server-i386-os -r repoclosure-rhel5server-i386-updates",
    hour        => 2,
    minute      => 0,
    environment => "MAILTO=$mailto",
    require     => Package["yum-utils"],
  }

  yumrepo {
    "repoclosure-cent4server-x86_64-os":
      descr   => "repoclosure-cent4server-x86_64-os",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/cent4server-x86_64/RPMS.os/";
    "repoclosure-cent4server-x86_64-updates":
      descr   => "repoclosure-cent4server-x86_64-updates",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/cent4server-x86_64/RPMS.updates/";
  }

  cron { "repoclosure cent4server-x86_64":
    ensure => $ensure,
    command     => "repoclosure -a x86_64 -q -n -t -r repoclosure-cent4server-x86_64-os -r repoclosure-cent4server-x86_64-updates",
    hour        => 2,
    minute      => 0,
    environment => "MAILTO=$mailto",
    require     => Package["yum-utils"],
  }

  yumrepo {
    "repoclosure-cent4server-i386-os":
      descr   => "repoclosure-cent4server-i386-os",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/cent4server-i386/RPMS.os/";
    "repoclosure-cent4server-i386-updates":
      descr   => "repoclosure-cent4server-i386-updates",
      enabled => 0,
      baseurl => "http://yo.puppetlabs.lan/cent4server-i386/RPMS.updates/";
  }

  cron { "repoclosure cent4server-i386":
    ensure => $ensure,
    command     => "repoclosure -q -n -t -r repoclosure-cent4server-i386-os -r repoclosure-cent4server-i386-updates",
    hour        => 2,
    minute      => 0,
    environment => "MAILTO=$mailto",
    require     => Package["yum-utils"],
  }
}