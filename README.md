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

# Building vagrant baseboxes

    $ rake baseboxes
    $ vagrant box add 'debian7x64' 'boxes/debian7x64.box'


[ChefDK]: https://www.getchef.com/downloads/chef-dk "Chef Development Kit"
[Vagrant]: https://www.vagrantup.com/downloads "Vagrant"
[RVM]: http://rvm.io/rvm/install "Ruby Version Manager"
[Packer]: https://packer.io/downloads.html "Packer"
