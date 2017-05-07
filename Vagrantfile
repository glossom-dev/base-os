Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

  config.vm.define "glossom-public-base-os" do |node|
    node.vm.box = "bento/ubuntu-16.04"
    node.vm.provision :shell, :inline => 'sudo -H bash -lc "apt update && which git || apt install git -y && git clone https://github.com/glossom-dev/glossom-public-base-os.git /tmp/glossom-public-base-os && cd /tmp/glossom-public-base-os && ./init.sh"'

    ## vagrant box add http://private.pkg.glossom.co.jp/vagrant/glossom-public-base-os-20170506.json
    #node.vm.box = "glossom-public-base-os-20170506"
    #node.vm.box_url = "http://private.pkg.glossom.co.jp/vagrant/glossom-public-base-os-20170506.box"
  end
end
