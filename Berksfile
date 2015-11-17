#!/usr/bin/env ruby
# ^syntax detection

source 'https://api.berkshelf.com'

cookbook 'ntp', '1.8.6'
cookbook 'ssh-keys', '1.2.7'
cookbook 'timezone', '0.0.1'
cookbook 'omnibus_updater', '1.0.2'
cookbook 'ssl_certificate', '1.9.0'

cookbook 'kludges-tanabata',
         path: 'site-cookbooks/kludges-tanabata'

cookbook 'attr-vault',
         git: 'https://github.com/realloc/cookbook-attr-vault.git',
         ref: 'develop'

cookbook 'file-vault',
         git: 'https://github.com/realloc/cookbook-file-vault.git',
         ref: 'master'
