name "ryoko_tanabata_dev"
description "Node-specific role for ryoko.tanabata.dev"
run_list(
          )
override_attributes(
                    "netconf" => {
                      "ifaces" => {
                        "eth0" => {
                          "onboot" => true,
                          "method" => "dhcp"
                        },
                        "eth1" => {
                          "onboot" => true,
                          "device" => "eth1",
                          "method" => "static",
                          "target" => "192.168.5.12",
                          "mask"   => "255.255.255.0"
                        }
                      }
                    }
                    )
