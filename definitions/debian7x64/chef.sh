#!/bin/bash
echo "Downloading Chef-client Omnibus package"
wget -q https://opscode-omnitruck-release.s3.amazonaws.com/debian/6/x86_64/chef_11.4.0-1.debian.6.0.5_amd64.deb -O /tmp/chef-client.deb
dpkg -i /tmp/chef-client.deb
rm -f /tmp/chef-client.deb
