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
                      "solourl" => "/vagrant/pkg",
                      "tarball" => "chef-cuisine.tar.gz"
                    }
                    )
