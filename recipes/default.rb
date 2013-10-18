#
# Cookbook Name:: maven-rally
# Recipe:: default
#
# Copyright (c) 2013 Rally Software Development Corp
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

remote_file node[:maven][:tar_path] do
  source node[:maven][:source_url]
end

execute 'tar xzf maven3' do
  command "tar xzf #{node[:maven][:archive]}"
  cwd node[:maven][:path]
  only_if "test -f #{node[:maven][:tar_path]}"
end

directory node[:maven][:install_path] do
  owner node[:maven][:owner]
  group node[:maven][:group]
  mode node[:maven][:mode]
  action :nothing
end

link node[:maven][:symlink_path] do
  to node[:maven][:install_path]
end

link "/usr/local/bin/mvn" do
  to "#{node[:maven][:symlink_path]}/bin/mvn"
end
