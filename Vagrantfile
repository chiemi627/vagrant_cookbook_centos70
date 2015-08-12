# -*- mode: ruby -*-
# vi: set ft=ruby :
Dotenv.load

Vagrant.configure(2) do |config|

  
  config.vm.box = "chef/centos-7.0"

  config.vm.provider :cloudstack do |cloudstack, override|
    override.vm.box = "dummy"
    override.vm.box_url = "https://github.com/schubergphilis/vagrant-cloudstack/raw/master/dummy.box"

    # Configurations to use api
    cloudstack.host	= "https"
    cloudstack.host	= "compute.jp-east.idcfcloud.com"
    cloudstack.path	= "/client/api"
    cloudstack.port	= "443"
    cloudstack.api_key  = "#{ENV['API_KEY']}"
    cloudstack.secret_key = "#{ENV['SECRET_KEY']}"

    cloudstack.template_name = "CentOS 7.0 64-bit for Vagrant"
    cloudstack.zone_name = "pascal"
    cloudstack.service_offering_name = "light.S1"
    cloudstack.keypair = "#{ENV['KEY_PAIR']}"

    cloudstack.port_forwarding_rules = [
      {
        :ipaddress => "#{ENV['IP_ADDRESS']}",
        :protocol => "tcp", :publicport => 22, :privateport => 22,
        :openfirewall => true
      },
      {
        :ipaddress => "#{ENV['IP_ADDRESS']}",
        :protocol => "tcp", :publicport => 80, :privateport => 80,
        :openfirewall => true
      },
      {
        :ipaddress => "#{ENV['IP_ADDRESS']}",
        :protocol => "tcp", :publicport => 3000, :privateport => 3000,
        :openfirewall => true
      }
    ]
    
    cloudstack.display_name = "centos7.0"
    override.ssh.host = "#{ENV['IP_ADDRESS']}"
    override.ssh.username = "vagrant"
    override.ssh.private_key_path = "#{ENV['PRIV_KEY_PATH']}"

  end

  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :private_network, ip: "192.168.33.10"

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true
  
  config.vm.provision "shell", inline: <<-SHELL
	sudo yum -y update kernel*
        sudo localedef -f UTF-8 -i ja_JP /usr/lib/locale/ja_JP.UTF-8
  SHELL

  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe  "apt"
    chef.add_recipe  "yum"
    chef.add_recipe  "emacs"
    chef.add_recipe  "git::default"
    chef.add_recipe  "git::source"
    chef.add_recipe  "git::windows"
    chef.add_recipe  "java"
    #chef.add_recipe "libffi"
    #chef.add_recipe "libffi::dev"
    chef.add_recipe  "ruby_build"
    chef.add_recipe  "rbenv"
    chef.add_recipe  "sqlite"
    chef.add_recipe "mysql::server"
    chef.add_recipe "mysql::client"
    chef.add_recipe "postgresql"
    chef.add_recipe "postgresql::server"
    chef.add_recipe "database::postgresql"
    chef.add_recipe "enpit"
    chef.add_recipe "enpit::github-connect"
    chef.add_recipe "enpit::generate_rails"
    chef.add_recipe "enpit::bash_profile"
    chef.add_recipe "enpit::gemrc"
    chef.add_recipe "enpit::gitconfig"
    chef.add_recipe "postgresql_setup"
    chef.add_recipe "golang"
    chef.add_recipe "hub"
    chef.add_recipe "rbenv-ruby"
    chef.add_recipe "vim"
    
    chef.json ={
      locale: {
        lang: "ja_JP.utf8",
        lc_all: "ja_JP.utf8"
      },
      mysql: {
        port:"3306",
        server_root_password:"vagrant",
        remove_anonymous_users:true
      },
      postgresql: {
        password: {
           postgres: "md5cae31bc247ad84a02394a8b12ff92d76"
        }
      }
	
    }
  end
end
