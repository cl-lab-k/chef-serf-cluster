#
# Rakefile Name:: chef-serf-cluster
#
# Copyright (c) 2015 CREATIONLINE,INC. All Rights Reserved.
#

#
# berkshelf
#
desc 'berks vendor'
task :vendor do
  sh 'berks vendor cookbooks'
end

desc 'berks upload'
task :upload do
  sh 'berks upload --no-ssl-verify --force'
end

#
# knife role
#
desc 'knife role upload'
task :role do
  sh "knife role from file roles/chef-serf-cluster.json"
end

#
# knife ssh
#
desc 'run chef-client'
task :converge do
  sh "knife ssh 'name:*' -x vagrant -P vagrant -a hostname 'sudo chef-client'"
end

desc 'run serf members'
task :serf_members do
  sh "knife ssh 'name:*' -x vagrant -P vagrant -a hostname 'serf members'"
end

desc 'show sample.conf'
task :sample_conf do
  sh "knife ssh 'name:*' -x vagrant -P vagrant -a hostname 'cat /tmp/sample.conf'"
end

task :default => [ :vendor, :upload, :role, :converge ]
#
# [EOF]
#
