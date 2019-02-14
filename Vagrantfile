# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The '2' in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.env.enable
  config.vbguest.auto_update = false
  config.vm.box = 'maier/alpine-3.8-x86_64'
  config.vm.network 'forwarded_port', guest: 32_768, host: 32_768
  config.vm.network 'forwarded_port', guest: 8989, host: 8989
  if ENV['DOCKER_VM_PORTS']
    ports = ENV['DOCKER_VM_PORTS']
    ports.split(",").each do |port|
      config.vm.network 'forwarded_port', guest: port, host: port
    end
  end
  config.vm.synced_folder '.', '/vagrant', disabled: true
  if ENV['DOCKER_VM_MOUNTS']
    mounts = ENV['DOCKER_VM_MOUNTS']
    mounts.split(",").each do |mount|
      config.vm.synced_folder mount, File.basename(mount)
    end
  end
  memory = ENV['DOCKER_VM_MEMORY'] || 6024
  cpus = ENV['DOCKER_VM_CPU'] || 2
  name = ENV['DOCKER_VM_NAME'] || 'docker_vm'

  config.vm.provider 'virtualbox' do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false

    vb.memory = memory
    vb.name = name
    vb.cpus = cpus
  end
  puts ' ---------------------------------------------------------------------'\
    '-----------------------------------'
  puts '               memory                             name                '\
    '             CPUS               '
  puts ' ---------------------------------------------------------------------'\
    '-----------------------------------'
  puts "                 #{memory}                         #{name}           "\
    "               #{cpus}           "
  puts ' --------------------------------------------------------------------'\
    '------------------------------------'

  config.vm.provision 'shell', path: 'setup_alpine.sh'
  config.vm.provision 'shell', path: 'install_essentials.sh'
  config.vm.provision 'shell', path: 'install_go.sh', privileged: false
  config.vm.provision 'shell', path: 'install_docker.sh'
  config.vm.provision 'shell', path: 'source_bashrc.sh', privileged: false
end
