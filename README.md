ziproxy Cookbook
==============
This cookbook installs ziproxy software

Requirements
------------
### Supported Operating Systems
- Debian-family Linux Distributions
- RedHat-family Linux Distributions

### Cookbooks
- Depends on `checkinstall` cookbook

Attributes
----------
### Recommended tunables

* `ziproxy['install_method']`
  - String. Defaults to `source`. Can be `source` or `package`
  - `source` downloads source codes and compile them, then executes checkinstall to install as package
  - `package` installs package from the existing repo via apt or yum, depending on the distribution

* `ziproxy['url']`
  - String. Points to the ziproxy source codes archive location

* `ziproxy['version']`
  - String. ziproxy version to be compiled

* `ziproxy['checksum']`
  - String. Source codes archive checksum

* `ziproxy['compression']['rate']`
  - String. Sets the jpeg compression rate

* `ziproxy['transparent']`
  - Bool. Sets ziproxy mode of operation
  - Defaults to true

* `ziproxy['max_size']`
  - Integer. Max file size to be compressed
  - Defaults to 10485760

* `ziproxy['allow_look_change']`
  - Bool. Allow the look and feel of compressed files
  - Defaults to true

* `ziproxy['convert_to_grayscale']`
  - Bool. Converts the images to grayscale if set to true
  - Defaults to false

* `ziproxy['process_jpg']`
  - Bool. Compresses jpg files if set to true
  - Defaults to true

* `ziproxy['process_png']`
  - Bool. Compresses png files if set to true
  - Defaults to true

* `ziproxy['process_gif']`
  - Bool. Compresses gif files if set to true
  - Defaults to true

### Source specific

* `ziproxy['prefix_dir']`
  - String. The path to prefix dir
  - Defaults to `/`

* `ziproxy['exec_prefix_dir']`
  - String. The path to exec_prefix dir
  - Defaults to `/usr`

* `ziproxy['config_dir']`
  - String. The path to configuration file dir
  - Defaults to `/etc/ziproxy`

* `ziproxy['doc_dir']`
  - String. The path to docs dir
  - Defaults to `/usr/share`

Usage
-----
#### ziproxy::default
Just include `ziproxy` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ziproxy]"
  ]
}
```

License and Authors
-------------------

- Author:: Rostyslav Fridman (rostyslav.fridman@gmail.com)

```text
Copyright 2014, Rostyslav Fridman

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
