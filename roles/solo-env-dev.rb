name "solo-env-dev"
description "Chef-solo environment for local.dev"
override_attributes("omnibus_updater" => {
                      "version" => '11.16.4-1',
                      "remove_chef_system_gem" => "yes",
                      "direct_url" => "https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-11.16.4-1.el6.x86_64.rpm"
                    }
                    )
