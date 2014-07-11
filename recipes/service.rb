#
# Cookbook Name:: ziproxy
# Recipe:: service
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

case node['platform']
  when "debian", "ubuntu"
    ziproxy_init = "ziproxy.init.erb"
  when "redhat", "centos", "amazon", "scientific"
    ziproxy_init = "ziproxy.init.rhel.erb"
end

template "/etc/init.d/ziproxy" do
  source ziproxy_init
  owner  "root"
  group  "root"
  mode   00744
end

template "#{node['ziproxy']['config_dir']}/ziproxy.conf" do
  source "ziproxy.conf.erb"
  owner  "root"
  group  "root"
  mode   00644
  variables :type => node['ziproxy']['type']
  notifies :restart, "service[ziproxy]"
end

service "ziproxy" do
  action [:enable, :start]
end
