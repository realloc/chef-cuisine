name 'zero-vmbase'
description 'Basic chef-zero role for virtual boxes'
run_list('recipe[omnibus_updater]',
         'recipe[ssh-keys]',
         'recipe[kludges-tanabata::chef-zerovm]'
          )
override_attributes(
                    'ssh_keys' => {
                      'root' => ['realloc']
                    },
                    'chef-solo' => {
                      'solourl' => '/vagrant/pkg',
                      'tarball' => 'tanabata-cuisine.tar.gz'
                    },
                    'omnibus_updater' => {
                      'kill_chef_on_upgrade' => false
                    }
                    )
