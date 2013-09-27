## Description
Installs and configures maven.

## Requirements
### Platform
* Centos 6.4
* Ubuntu 12.4

## Attributes
See `attributes/default.rb` for default values

* `node[:maven][:version]` - Specifies the version of maven to install.
* `node[:maven][:path]` - Path to use for installation
* `node[:maven][:owner]` - Owner of maven directory
* `node[:maven][:group]` = Group of maven directory
* `node[:maven][:mode]` = Mode of maven directory
* `node[:maven][:file_name]` = File name of maven binary to download
* `node[:maven][:archive]` = File name of maven binary including extension
* `node[:maven][:tar_path]` = Location to download the `:tar_path` to
* `node[:maven][:install_path]` = Location of untarred binary
* `node[:maven][:symlink_path]` = Path of symlink
* `node[:maven][:source_url]` = Specifies full URL to download archive

## Recipes
### default
Installs and configures maven.

## License
Copyright (c) Rally Software Development Corp. 2013

Distributed under the MIT License.
