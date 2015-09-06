# Kludge for chef-solo config in VM env.

['/etc/chef', '/var/chef-zero', '/var/log/chef'].each do |dir|
  directory dir do
    recursive true
    owner 'root'
    group 'root'
    mode 0755
    action :create
  end
end

template '/etc/chef/client.rb' do
  variables('solourl' => node['chef-solo']['solourl'])
  source 'client.rb.erb'
  owner 'root'
  group 'root'
  mode 0644
  action :create
end
