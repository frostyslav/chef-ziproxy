#
# Cookbook Name:: ziproxy
# Recipe:: install
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

user node['ziproxy']['user'] do
  comment "Ziproxy user"
  system true
  shell "/bin/false"
end

group node['ziproxy']['group'] do
  system true
end

case node['platform']
  when "debian", "ubuntu"
    %w{libgif-dev libjpeg-dev libpng-dev libjasper-dev libsasl2-dev}.each do |pkg|
      package pkg do
        action :install
      end
    end
  when "redhat", "centos", "amazon", "scientific"
    %w{giflib-devel openjpeg-devel libjpeg-turbo-devel libpng-devel jasper-devel cyrus-sasl-devel libgsasl-devel}.each do |pkg|
      package pkg do
        action :install
      end
    end
end

include_recipe "ziproxy::#{node['ziproxy']['install_method']}"
