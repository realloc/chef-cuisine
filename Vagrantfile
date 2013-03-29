# -*- mode: ruby -*-

intnetname="devnet"
intdomain=".dev.realloc.spb.ru"
vbnet="192.168.33"

Vagrant::Config.run do |config|

  config.vm.define :rainbowdash do |rainbowdash|
    rainbowdash.vm.box = "debian6x64-chef11"
    rainbowdash.vm.box_url = "http://vagrant.clodo.ru/clododevenv/debian6x64-chef11.box"
    rainbowdash.vm.host_name = "rainbowdash#{intdomain}"
    rainbowdash.vm.boot_mode = :gui
    rainbowdash.vm.network :hostonly, "#{vbnet}.11" , :adapter => 2
    rainbowdash.vm.customize ["modifyvm", :id, "--memory", 512]
    rainbowdash.vm.customize ["modifyvm", :id, "--name", "rainbowdash"]
    rainbowdash.vm.customize ["modifyvm", :id, "--nic3", "intnet", "--intnet3", "#{intnetname}"]
    rainbowdash.vm.provision :chef_solo do |chef|
      chef.data_bags_path = "data_bags"
      chef.cookbooks_path = "cookbooks.solo"
      chef.roles_path = "roles"
      chef.add_role "solo-vmbase"
      chef.add_role "solo-env-dev"
    end
  end
end
