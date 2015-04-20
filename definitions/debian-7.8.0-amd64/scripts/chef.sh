# Install Chef
echo "Downloading Chef-client Omnibus package"
wget -q https://opscode-omnibus-packages.s3.amazonaws.com/debian/6/x86_64/chef_12.2.1-1_amd64.deb -O /tmp/chef-client.deb
dpkg -i /tmp/chef-client.deb
rm -f /tmp/chef-client.deb

