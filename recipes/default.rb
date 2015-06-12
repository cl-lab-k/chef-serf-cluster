#
# Cookbook Name:: chef-serf-cluster
# Recipe:: default
#
# Copyright (c) 2015 CREATIONLINE,INC. All Rights Reserved.
#

cookbook_file '/etc/sample.conf' do
  source 'sample.conf'
  owner 'root'
  group 'root'
  mode 0644
  action :create_if_missing
end

directory '/var/lib/serf/scripts' do
  owner 'root'
  group 'root'
  mode 0755
  recursive true
end

cookbook_file '/var/lib/serf/scripts/chef-apply.sh' do
  source 'chef-apply.sh'
  owner 'root'
  group 'root'
  mode 0755
end

cookbook_file '/var/lib/serf/scripts/update-sample-conf.rb' do
  source 'update-sample-conf.rb'
  owner 'root'
  group 'root'
  mode 0755
end

#
# [EOF]
#
