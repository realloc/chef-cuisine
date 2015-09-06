name 'solo-env-dev'
description 'Chef-solo environment for local.dev'
override_attributes(
  'omnibus_updater' => {
    'version' => '12.0.3-1',
    'remove_chef_system_gem' => 'yes'
  }
)
