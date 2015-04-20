#!/usr/bin/env ruby
#^syntax detection

source 'https://api.berkshelf.com'

cookbook 'ntp' , '1.6.5'
cookbook 'ssh-keys', '1.0.0'
cookbook 'timezone', '0.0.1'
cookbook 'omnibus_updater', '1.0.2'
cookbook 'ssl_certificate', '1.4.0'
cookbook 'file-vault', '0.0.2'

cookbook 'kludges-tanabata',
  :path => 'site-cookbooks/kludges-tanabata'

cookbook 'attr-vault',
  :git => 'https://github.com/realloc/cookbook-attr-vault.git',
  :ref => 'develop'
