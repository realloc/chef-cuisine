# Intro

Chef-Cuisine is a simple way to organize repository for some
Infrastructure (as in Infrastructure as a Code) using Chef.

# Requirements

* ChefDK
* Vagrant
* RVM

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
