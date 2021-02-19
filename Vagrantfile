Vagrant.configure("2") do |config|

  config.vm.box = "debian/contrib-buster64"
  
  config.vm.synced_folder "salt/roots/", "/srv/salt/"
  config.vm.synced_folder "docker", "/srv/salt/formulas/docker"
  config.vm.synced_folder "salt/pillar/", "/srv/pillar/"
  config.vm.network "private_network", type: "dhcp"
  ## Use all the defaults:
  config.vm.provision :salt do |salt|

    salt.masterless = true
    salt.minion_config = "salt/minion"
    salt.run_highstate = true

  end
 

end
