default[:maven][:version] = '3.0.5'
default[:maven][:path] = '/usr/local'
default[:maven][:owner] = 'root'
default[:maven][:group] = 'root'
default[:maven][:mode] = '0755'
default[:maven][:file_name] = "apache-maven-#{node[:maven][:version]}"
default[:maven][:archive] = "#{node[:maven][:file_name]}-bin.tar.gz"
default[:maven][:tar_path] = "#{node[:maven][:path]}/#{node[:maven][:archive]}"
default[:maven][:install_path] = "#{node[:maven][:path]}/#{node[:maven][:file_name]}"
default[:maven][:symlink_path] = "#{node[:maven][:path]}/maven"
default[:maven][:source_url] = "http://apache.mirrors.tds.net/maven/maven-3/#{node[:maven][:version]}/binaries/#{node[:maven][:archive]}"
