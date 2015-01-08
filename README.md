# Intro

Chef-Cuisine is a simple way to organize repository for some
Infrastructure (as in Infrastructure as a Code) using Chef.

Cuisine, as said in Wikipedia, is a characteristic style of cooking
practices and traditions, often associated with a specific culture.
Following cooking metaphor used in Chef community, I think it's a good
name for a place where we gather practices and traditions of building
and managing a particular infrastructure project.

This repository uses example project 'Tanabata' to show how to use
cuisine and related tools. Please see wiki for more detailed
documentation.

# Requirements

* [ChefDK][ChefDK]
* [Vagrant][Vagrant]
* [RVM][RVM]
* [Packer][Packer]

# Quick Start

Just go to cloned repo directory and follow the instructions.

Populate cookbooks

    $ rake

Run sample VM

    $ vagrant up ryoko

Connect via ssh and run Chef

    $ vagrant ssh ryoko
    vagrant@ryoko:~$ sudo chef-solo

Have fun!

# Repository structure

* `conf/` - Contains configuration files for Chef named after environments.
* `cookbooks/` - Cookbooks gathered by Berkshelf.
* `data_bags/` - Data Bags and items. JSON format is used.
* `definitions/` - Packer templates for Vagrant baseboxes. Ypu may add other types as well.
* `misc/` - Useful scripts and files for particular Infrastructure project.
* `nodes/` - Run-list definitions for each node specified by FQDN. May be symlinks.
* `pkg/` - Resulting tarball stored here.
* `roles/` - Roles in Ruby format. Not JSON because of comments, but you may change that.
* `site-local/` - Cookbooks specific to this very local infrastructure that are unusable anywhere else.
* `Berksfile` - List of cookbooks to fetch and pack. Dependencies will be solved by Berkshelf.
* `Berksfile.lock` - Versions of all cookbooks and dependencies.
* `Gemfile` - List of Ruby gems used in cuisine.
* `Gemfile.lock` - Versions of gems and dependencies.
* `Rakefile` - Rake targets for cuisine tasks.
* `Vagrantfile` - Vagrant boxes configuration.

# Building vagrant baseboxes

    $ rake baseboxes
    $ vagrant box add 'debian-7.7.0-amd64' 'boxes/debian-7.7.0-amd64.box'

# Copyright and license

Copyright 2014 Stanislav Bogatyrev

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  [http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[ChefDK]: https://www.getchef.com/downloads/chef-dk "Chef Development Kit"
[Vagrant]: https://www.vagrantup.com/downloads "Vagrant"
[RVM]: http://rvm.io/rvm/install "Ruby Version Manager"
[Packer]: https://packer.io/downloads.html "Packer"
