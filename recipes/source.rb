#
# Cookbook Name:: ziproxy
# Recipe:: source
# Author:: Rostyslav Fridman (<rostyslav.fridman@gmail.com>)
#
# Copyright 2014, Rostyslav Fridman
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "checkinstall::default"

%W{#{node['ziproxy']['log_dir']} #{node['ziproxy']['config_dir']}}.each do |folder|
  directory folder do
    owner  node['ziproxy']['user']
    group  node['ziproxy']['group']
    mode   00755
    action :create
  end
end

remote_file "#{Chef::Config['file_cache_path']}/ziproxy-#{node['ziproxy']['version']}.tar.bz2" do
  source   "#{node['ziproxy']['url']}/ziproxy-#{node['ziproxy']['version']}.tar.bz2"
  checksum node['ziproxy']['checksum']
  mode     00644
end

checkinstall_package "ziproxy" do
  source_archive "#{Chef::Config['file_cache_path']}/ziproxy-#{node['ziproxy']['version']}.tar.bz2"
  configure_options node['ziproxy']['configure_options']
  version node['ziproxy']['version']
end
