name "solo-vmbase"
description "Basic chef-solo role for virtual boxes"
run_list( "recipe[ssh-keys]",
          "recipe[ntp]",
          "recipe[kludges-tanabata::chef-solovm]"
          )
override_attributes(
                    "ssh_keys" => {
                      "root" => ["realloc"]
                    },
                    "chef-solo" => {
                      "solourl" => "http://192.168.5.1/chef",
                      "tarball" => "tanabata-cuisine.tar.gz"
                    }
                    )
