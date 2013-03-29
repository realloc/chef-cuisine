# -*- mode: ruby -*-

intnetname="devnet"
intdomain=".old.clodo.ru"
vbnet="192.168.33"

Vagrant::Config.run do |config|

  config.vm.define :builder do |builder|
    builder.vm.box = "debian6x64"
    builder.vm.box_url = "http://vagrant.clodo.ru/clododevenv/debian6x64.box"
    builder.vm.host_name = "builder#{intdomain}"
    builder.vm.boot_mode = :gui
    builder.vm.network :hostonly, "#{vbnet}.11" , :adapter => 2
    builder.vm.customize ["modifyvm", :id, "--memory", 768]
    builder.vm.customize ["modifyvm", :id, "--name", "builder"]
    builder.vm.customize ["modifyvm", :id, "--nic3", "intnet", "--intnet3", "#{intnetname}"]
    builder.vm.provision :chef_solo do |chef|
      chef.data_bags_path = "data_bags"
      chef.cookbooks_path = "cookbooks.solo"
      chef.roles_path = "roles"
      chef.add_role "solo-vmbase"
    end
  end

  config.vm.define :chef do |chef|
    chef.vm.box = "debian6x64"
    chef.vm.box_url = "http://vagrant.clodo.ru/clododevenv/debian6x64.box"
    chef.vm.host_name = "chef#{intdomain}"
    chef.vm.boot_mode = :gui
    chef.vm.network :hostonly, "#{vbnet}.10" , :adapter => 2
    chef.vm.customize ["modifyvm", :id, "--memory", 512]
    chef.vm.customize ["modifyvm", :id, "--name", "chef"]
    chef.vm.customize ["modifyvm", :id, "--nic3", "intnet", "--intnet3", "#{intnetname}"]
    chef.vm.provision :chef_solo do |chef|
      chef.data_bags_path = "data_bags"
      chef.cookbooks_path = "cookbooks.solo"
      chef.roles_path = "roles"
      chef.add_role "solo-vmbase"
    end
  end

  config.vm.define :admin do |admin|
    admin.vm.box = "debian6x64"
    admin.vm.box_url = "http://vagrant.clodo.ru/clododevenv/debian6x64.box"
    admin.vm.host_name = "admin#{intdomain}"
    admin.vm.boot_mode = :gui
    admin.vm.network :hostonly, "#{vbnet}.9" , :adapter => 2
    admin.vm.customize ["modifyvm", :id, "--memory", 512]
    admin.vm.customize ["modifyvm", :id, "--name", "admin"]
    admin.vm.customize ["modifyvm", :id, "--nic3", "intnet", "--intnet3", "#{intnetname}"]
    admin.vm.provision :chef_solo do |admin|
      admin.data_bags_path = "data_bags"
      admin.cookbooks_path = "cookbooks.solo"
      admin.roles_path = "roles"
      admin.add_role "solo-vmbase"
    end
  end
  
  config.vm.define :oldcc00 do |cc00|
    cc00.vm.box = "debian6x64"
    cc00.vm.box_url = "http://vagrant.clodo.ru/clododevenv/debian6x64.box"
    cc00.vm.host_name = "cc00#{intdomain}"
    cc00.vm.boot_mode = :gui
    cc00.vm.network :hostonly, "#{vbnet}.253" , :adapter => 2
    cc00.vm.customize ["modifyvm", :id, "--memory", 768]
    cc00.vm.customize ["modifyvm", :id, "--name", "oldcc00"]
    cc00.vm.customize ["modifyvm", :id, "--nic3", "intnet", "--intnet3", "#{intnetname}"]
    cc00.vm.customize ["modifyvm", :id, "--nic4", "intnet", "--intnet4", "ccintnet"]
    cc00.vm.provision :chef_solo do |chef|
      chef.data_bags_path = "data_bags"
      chef.cookbooks_path = "cookbooks.solo"
      chef.roles_path = "roles"
      chef.add_role "solo-vmbase"
    end
  end

  config.vm.define :oldcc01 do |cc01|
    cc01.vm.box = "debian6x64"
    cc01.vm.box_url = "http://vagrant.clodo.ru/clododevenv/debian6x64.box"
    cc01.vm.host_name = "cc01#{intdomain}"
    cc01.vm.boot_mode = :gui
    cc01.vm.network :hostonly, "#{vbnet}.254" , :adapter => 2
    cc01.vm.customize ["modifyvm", :id, "--memory", 768]
    cc01.vm.customize ["modifyvm", :id, "--name", "oldcc01"]
    cc01.vm.customize ["modifyvm", :id, "--nic3", "intnet", "--intnet3", "#{intnetname}"]
    cc01.vm.customize ["modifyvm", :id, "--nic4", "intnet", "--intnet4", "ccintnet"]
    cc01.vm.provision :chef_solo do |chef|
      chef.data_bags_path = "data_bags"
      chef.cookbooks_path = "cookbooks.solo"
      chef.roles_path = "roles"
      chef.add_role "solo-vmbase"
    end
  end
end
