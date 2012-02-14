

#
#  heartbeat::resource {
#    "web01 IPaddr::192.168.0.20/24/br0":
#  }

define heartbeat::resource ($resource) {

  concat::fragment { "resource-$name":
    target => '/etc/heartbeat/haresources',
    content => "$resource\n";
  }

}
