name "solo-env-dev"
description "Chef-solo environment emulation"
override_attributes("omnibus_updater" => {
                      "version" => '11.6.2-1',
                      "remove_chef_system_gem" => "yes",
                      "direct_url" => "http://static.realloc.spb.ru/chef/chef_11.6.2-1.debian.6.0.5_amd64.deb"
                    }
                    )
                    
