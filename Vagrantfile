Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  config.vm.define "glossom-public-base-os" do |node|
    node.ssh.insert_key = true
    node.vm.boot_timeout = 20
    node.vm.box = "bento/ubuntu-16.04"
    node.vm.provision :shell, :inline => 'sudo -H bash -lc "/vagrant/init_16.04.sh"'

    ## vagrant box add http://private.pkg.glossom.co.jp/vagrant/glossom-public-base-os-20170506.json
    #node.vm.box = "glossom-public-base-os-20170506"
    #node.vm.box_url = "http://private.pkg.glossom.co.jp/vagrant/glossom-public-base-os-20170506.box"
  end

  config.vm.define "glossom-public-base-os_20.04" do |node|
    node.ssh.insert_key = true
    node.vm.boot_timeout = 40
    node.vm.box = "bento/ubuntu-20.04"
    node.vm.provision :shell, :inline => 'sudo -H bash -lc "/vagrant/init_20.04.sh"'
  end

end
