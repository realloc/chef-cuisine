name "ryoko_tanabata_dev"
description "Node-specific role for ryoko.tanabata.dev"
run_list(
  "recipe[ssl_certificate::attr_apply]",
  "recipe[file-vault]",
  "recipe[attr-vault]",
  "recipe[kludges-tanabata::attr-file]"
)
override_attributes(
  "ssl_certificate" => {
    "items" => [
      { "name" => "tanabata.dev",
        "dir" => '/etc/nginx/ssl',
        "item" => 'tanabata_dev',
        "source" => 'chef-vault',
        "bag" => 'ssl-vault',
        "ssl_key" => {
          "item_key" => 'key'
        },
        "ssl_cert" => {
          "item_key" => 'cert'
        }
      }
    ]
  },
  "file-vault" => {
    "files" => [
      { "name" => "/root/ms_license.key",
        "item" => "ms_license_key"
      }
    ]
  },
  "flurb" => {
    "foop" => {
      "buzz" => "NotASecret"
    }
  },
  "attr-vault" => {
    "configs" => {
      "flurb" => {
        'precedence_level' => 'force_override',
        'bag_cascade' => [
          'chef_vault_item[attr-vault::flurb]'
        ]
      }
    }
  }
)

