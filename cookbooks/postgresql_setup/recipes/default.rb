#
# Cookbook Name:: postgresql_setup
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "build-essential"
include_recipe "postgresql::server"
include_recipe "database::postgresql"

# connection info

postgresql_connection_info = {
  :host     => '127.0.0.1',
  :port     => node['postgresql']['config']['port'],
  :username => 'postgres',
  :password => node['postgresql']['password']['postgres']
}

postgresql_database_user 'vagrant' do
  connection postgresql_connection_info
  password 'md5ce5f2d27bc6276a03b0328878c1dc0e2'
  superuser true
  login true
  action :create
end


# create a postgresql database
postgresql_database 'vagrant' do
  connection postgresql_connection_info
  encoding "UTF-8"
  action :create
end

postgresql_database_user 'vagrant' do
  connection postgresql_connection_info
  database_name 'vagrant'
  privileges [:all]
  action :grant
end

change_notify = node['postgresql']['server']['config_change_notify']

template "#{node['postgresql']['dir']}/pg_hba.conf" do
  source "pg_hba.conf.erb"
  owner "postgres"
  group "postgres"
  mode 0600
  notifies change_notify, 'service[postgresql]', :immediately
end
