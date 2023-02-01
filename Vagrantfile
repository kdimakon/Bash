Vagrant.configure("2") do |config|
    config.vm.define "ubuntu_1" do |ubuntu|
      config.vm.box = "ubuntu/trusty64"
      ubuntu.vm.network "forwardwd_port", guest: 80, host: 8083
      ubuntu.vm.network "private_network", ip:"x.x.x.x"
      ubuntu.vm.provider "virtualbox" do |vb|
          vb.gui = false
          vb.memory = "1024"
        end
        ubuntu.vm.provisiov "shell", inline: <<-SHELL 
          apt-get update
          apt-get install -y apache2
        SHELL
      end
  end