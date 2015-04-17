#!/usr/bin/env ruby
#^syntax detection

source 'https://api.berkshelf.com'

cookbook 'ntp' , '1.6.5'
cookbook 'ssh-keys', '1.0.0'
cookbook 'timezone', '0.0.1'
cookbook 'omnibus_updater', '1.0.2'

cookbook 'file-vault', '0.0.2'

cookbook 'kludges-tanabata',
  :path => 'site-cookbooks/kludges-tanabata'

cookbook 'attr-vault',
  :git => 'https://github.com/realloc/cookbook-attr-vault.git',
  :ref => 'develop'

cookbook 'ssl_certificate',
  :git => 'git@github.com:onddo/ssl_certificate-cookbook.git',
  :ref => 'a04beeba638cfd7e4413a91e4455425df38d41b6'
