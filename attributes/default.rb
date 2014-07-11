#
# Cookbook Name:: ziproxy
# Attribute:: default
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

default['ziproxy']['user'] = "ziproxy"
default['ziproxy']['group'] = "ziproxy"
default['ziproxy']['install_method'] = "source"

# Used for source installation
#default['ziproxy']['url'] = "http://sourceforge.net/projects/ziproxy/files/ziproxy/ziproxy-3.3.0/"
default['ziproxy']['url'] = "http://skylink.dl.sourceforge.net/project/ziproxy/ziproxy/ziproxy-3.3.0"
default['ziproxy']['version'] = "3.3.0"
default['ziproxy']['checksum'] = "1f998ae3aef606c6d60db138a23ac331176300fe13fb2bbae25acbb42365e22d"
default['ziproxy']['prefix_dir'] = "/"
default['ziproxy']['exec_prefix_dir'] = "/usr"
default['ziproxy']['log_dir'] = "/var/log/ziproxy"
default['ziproxy']['config_dir'] = "/etc/ziproxy"
default['ziproxy']['doc_dir'] = "/usr/share"
default['ziproxy']['configure_options'] = %W{
--prefix=#{ziproxy['prefix_dir']}
--exec-prefix=#{ziproxy['exec_prefix_dir']}
--datarootdir=#{ziproxy['doc_dir']}
}

default['ziproxy']['port'] = 8081
default['ziproxy']['next_proxy'] = true
default['ziproxy']['compression']['rate'] = "50, 55, 60, 65"

default['ziproxy']['address'] = "127.0.0.1"
default['ziproxy']['transparent'] = true
default['ziproxy']['override_accept_encoding'] = true
default['ziproxy']['conventional_proxy'] = true
default['ziproxy']['max_size'] = 10485760
default['ziproxy']['use_content_length'] = false
default['ziproxy']['gzip'] = true
default['ziproxy']['allow_look_change'] = true
default['ziproxy']['convert_to_grayscale'] = false
default['ziproxy']['process_jpg'] = true
default['ziproxy']['process_png'] = true
default['ziproxy']['process_gif'] = true

default['ziproxy']['next_proxy']['address'] = "127.0.0.1"
default['ziproxy']['next_proxy']['port'] = 8090
