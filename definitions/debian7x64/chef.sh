#!/bin/bash
echo "Downloading Chef-client Omnibus package"
wget -q http://static.realloc.spb.ru/chef/chef_11.6.2-1.debian.6.0.5_amd64.deb -O /tmp/chef-client.deb
dpkg -i /tmp/chef-client.deb
rm -f /tmp/chef-client.deb
