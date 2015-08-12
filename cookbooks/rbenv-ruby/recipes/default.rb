#
# Cookbook Name:: rbenv-ruby
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

include_recipe "rbenv::rbenv_vars"


rbenv_ruby "2.2.2" do 
	ruby_version "2.2.2"
	global true
end

%w[bundler rails travis sinatra].each do |gem_name|
  rbenv_gem gem_name do
    ruby_version "2.2.2"
  end
end
