name "solo-env-dev"
description "Chef-solo environment emulation"
override_attributes("omnibus_updater" => {
                      "version" => '11.4.0-1',
                      "remove_chef_system_gem" => "yes"
                    }
                    )
                    
