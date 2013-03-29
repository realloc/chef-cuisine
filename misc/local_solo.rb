file_cache_path "/var/chef-solo"
cookbook_path "/var/chef-solo/cookbooks"
data_bag_path "/var/chef-solo/data_bags"
role_path "/var/chef-solo/roles"

json_attribs "/srv/www/chef/" + `hostname -f`.chomp! + ".json"
recipe_url "/srv/www/chef/chef-solo.tar.gz"

log_location "/var/log/chef/solo.log"
verbose_logging true
