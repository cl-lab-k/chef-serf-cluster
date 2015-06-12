#!/usr/bin/chef-apply

servers = []
STDIN.each_line do |l|
  node, ipaddr, role, tags = l.split( /\s+/, 4 )
  servers.push( ipaddr )
end

file '/etc/sample.conf' do
  _file = Chef::Util::FileEdit.new( path )

  case ENV[ 'SERF_EVENT' ]
  when 'member-join'
    s = servers.collect {|a| "\tserver #{a};\n"}.join
    _file.search_file_replace_line( "^\t#server", "#{s}\t#server\n" )
  when 'member-leave', 'memebr-failed'
    servers.each do |s|
      _file.search_file_replace_line( "^\tserver #{s};", '' )
    end
  end

  content _file.send( :editor ).lines.join
end

#
# [EOF]
#
