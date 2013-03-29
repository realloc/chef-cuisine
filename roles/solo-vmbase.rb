name "solo-vmbase"
description "Basic chef-solo role for virtual boxes"
run_list( "recipe[omnibus_updater]",
          "recipe[platform_packages]"
          )
override_attributes("platform_packages" => {
                       "pkgs" =>
                       [ { 'name' => 'htop'},
                         { 'name' => 'mc'},
                         { 'name' => 'psmisc'},
                         { 'name' => 'sudo'},
                         { 'name' => 'curl'},
                         { 'name' => 'wget'}
                       ]
                     }
                    )
                    
