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
* [Packer][Packer]
* [VirtualBox][VirtualBox]

# Quick Start

Just go to cloned repo directory and follow the instructions.

Populate cookbooks

    $ rake

Run sample VM

    $ vagrant up ryoko

Connect via ssh and run Chef

    $ vagrant ssh ryoko
    vagrant@ryoko:~$ sudo chef-client

Have fun!

# Repository structure

* `conf/` - Contains configuration files for Chef named after environments.
* `cookbooks/` - Cookbooks gathered by Berkshelf.
* `data_bags/` - Data Bags and items. JSON format is used.
* `definitions/` - Packer templates for Vagrant baseboxes. You may add other types as well.
* `misc/` - Useful scripts and files for particular Infrastructure project.
* `nodes/` - Run-list definitions for each node specified by FQDN. May be symlinks.
* `pkg/` - Resulting tarball stored here.
* `roles/` - Roles in Ruby format. Not JSON because of comments, but you may change that.
* `site-cookbooks/` - Cookbooks specific to this very local infrastructure that are unusable anywhere else.
* `Berksfile` - List of cookbooks to fetch and pack. Dependencies will be solved by Berkshelf.
* `Berksfile.lock` - Versions of all cookbooks and dependencies.
* `Gemfile` - List of Ruby gems used in cuisine.
* `Gemfile.lock` - Versions of gems and dependencies.
* `Rakefile` - Rake targets for cuisine tasks.
* `Vagrantfile` - Vagrant boxes configuration.

## conf

Chef's and other configuration files for different environments of
Infrastructure. They are not processes automatically, use them in a
way you like.

## cookbooks

This directory contains the cookbooks used to configure systems in
your infrastructure. Berkshelf will fetch all cookbooks listed in
Beksfile, including dependencies, and put them here.

You should not do any manual changes here except one special case
during development. When you want to quickly change some cookbook and
test it in running vm you can do `rake qpack` to pack tarball with
current contents of `cookbooks` directory. Don't forget to reproduce
your changes later in corresponding cookbook repository.

## data_bags

Each subdirectory represents a Data Bag and contains JSON files for
data bag items. Sometimes one may want to generate databags items
with scripts (JSON is easy!) for example items with users' ssh keys.

## definitions

In older version of chef-cuisine veewee was used for Vagrant boxes
generation. When we moved to packer the old directory name left, so
feel free to submit PR fixing this issue.

## misc

This directory should be used to store small useful scripts that work
with data in this repo or required to manipulate chef-related things
on boxes. For example a script generating ssh keys and putting them in
data-bag is a good candidate.

## nodes

Each node is identified by it's FQDN. For each node there must be a
json file with it's run-list defined.

Try not to include in run-list anything but roles. If you want to add
specific recipe it should go to node's personal role. Otherwise it
will create a mess hard to understand and debug by others.

## pkg

Here you will find resulting tarball for distribution in your
infrastructure. Nothing fancy here.

## roles

Roles are stored here. Please prefer Ruby DSL format because it
supports comments. Our experience says that adding comments to some
attribute values or explaining why particular order of recipes in
run-list is chosen is extremely valuable.

## site-cookbooks

In normal situation you would want to use separate repository for each
of your cookbooks. However there are situations when you need to have
some cookbooks usable only in one infrastructure project, like
collections of kludges, in the same source tree. In such cases you
have to put then in this directory and reference them in Berksfile
like local resources.

```ruby
cookbook 'kludges-tanabata',
  :path => 'site-cookbooks/kludges-tanabata'
```

# Building vagrant baseboxes

    $ rake baseboxes
    $ vagrant box add 'debian-7.8.0-amd64' 'boxes/debian-7.8.0-amd64.box'

# Copyright and license

Copyright 2015 Stanislav Bogatyrev

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
[Packer]: https://packer.io/downloads.html "Packer"
[VirtualBox]: https://www.virtualbox.org/ "VirtualBox"
