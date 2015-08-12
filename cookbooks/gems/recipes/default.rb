#
# Cookbook Name:: gems
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash 'install_rubygems' do
  code <<-BASH
    git clone https://github.com/rubygems/rubygems.git
    cd rubygems
    ruby setup.rb
  BASH
  action :run
end

