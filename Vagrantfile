Vagrant.configure("2") do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

  config.vm.define "glossom-public-base-os" do |node|
    node.vm.box = "bento/ubuntu-16.04"
  end
end
