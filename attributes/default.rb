#
# Cookbook Name:: chef-serf-cluster
# Attribute:: default
#
# Copyright (c) 2015 CREATIONLINE,INC. All Rights Reserved.
#

default['serf']['event_handlers'] = [
  {
    'url' => 'file:///var/lib/serf/scripts/chef-apply.sh',
    'event_type' => 'member-join,member-failed,member-leave'
  }
]
default['serf']['version'] = '0.6.4' # 2015/02/13 latest
default['serf']['agent']['discover'] = 'sample'
default['serf']['agent']['interface'] = 'eth1' # vagrant

#
# [EOF]
#
