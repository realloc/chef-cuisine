# -*- mode: ruby -*-

intnetname="dev"
intdomain="tanabata.dev"
vbnet="192.168.33"

Vagrant::Config.run do |config|

  config.vm.define :ryoko do |ryoko|
    ryoko.vm.box = "debian7x64"
    ryoko.vm.box_url = "https://realloc.spb.ru/boxes/debian-7.6.0-amd64.box"
    ryoko.vm.host_name = "ryoko.#{intdomain}"
    ryoko.vm.boot_mode = :gui
    ryoko.vm.network :hostonly, "#{vbnet}.11" , :adapter => 2
    ryoko.vm.customize ["modifyvm", :id, "--memory", 512]
    ryoko.vm.customize ["modifyvm", :id, "--name", "ryoko"]
    ryoko.vm.customize ["modifyvm", :id, "--nic3", "intnet", "--intnet3", "#{intnetname}"]
    ryoko.vm.provision :chef_solo do |chef|
      chef.data_bags_path = "data_bags"
      chef.cookbooks_path = "cookbooks.solo"
      chef.roles_path = "roles"
      chef.add_role "solo-vmbase"
      chef.add_role "solo-env-dev"
    end
  end
end
