Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

  config.vm.define "glossom-public-base-os" do |node|
    node.vm.box = "bento/ubuntu-16.04"

    ## vagrant box add http://private.pkg.glossom.co.jp/vagrant/glossom-public-base-os-20170506.json
    #node.vm.box = "glossom-public-base-os-20170506"
    #node.vm.box_url = "http://private.pkg.glossom.co.jp/vagrant/glossom-public-base-os-20170506.box"
  end
end
