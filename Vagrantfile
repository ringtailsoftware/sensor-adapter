VAGRANTFILE_API_VERSION = "2"

######### START OF PROVISIONING SHELL SCRIPT ####################
$script = <<SCRIPT
apt-get update
apt-get install -y curl
curl -fsSL https://raw.githubusercontent.com/platformio/platformio-core/master/scripts/99-platformio-udev.rules | sudo tee /etc/udev/rules.d/99-platformio-udev.rules
usermod -a -G dialout vagrant
SCRIPT
########## END OF PROVISIONING SHELL SCRIPT #####################

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 1024]
    v.customize ["modifyvm", :id, "--cableconnected1", "on"]
    v.cpus = 1
    v.gui = false
    v.customize ['modifyvm', :id, '--usb', 'on']
    v.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'featherm0', '--vendorid', '0x239a', '--productid', '0x8023']
    v.customize ['usbfilter', 'add', '0', '--target', :id, '--name', 'featherm0_flash', '--vendorid', '0x239a', '--productid', '0x001b']
  end

  # host
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.provision "shell", inline: $script
  config.vm.hostname = "rustdev"
  config.ssh.forward_agent = true
  config.ssh.forward_x11 = false
end
