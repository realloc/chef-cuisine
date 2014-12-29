name             "kludges-tanabata"
maintainer       "Stanislav Bogatyrev"
maintainer_email "realloc@realloc.spb.ru"
license          "Apache 2.0"
description      "Collection of kludges for Tanabata example project"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
recipe           "kludges-tanabata::chef-solovm","Chef-solo VirtualBox kludges"

%w{ debian }.each do |os|
  supports os
end

