#
# Cookbook Name:: hub
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

bash 'install_hub' do
  code <<-BASH
    export PATH=$PATH:/usr/local/go/bin
    git clone https://github.com/github/hub.git
    cd hub
    ./script/build
    cp hub /usr/local/bin/hub
  BASH
  action :run
end
