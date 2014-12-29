# -*- coding: utf-8 -*-
# -*- mode: ruby -*-
require 'rake'
require 'rake/clean'
require 'fileutils'

directory 'cookbooks'
directory 'pkg'
directory 'boxes'

pkgname = ENV["CUISINEPKG"] || File.basename(Dir.pwd)

desc "Artifact cleaner"
def artclean(cpath)
  # Clean git
  Dir.glob("#{cpath}/**/.git").each{|gd| FileUtils.rm_rf gd}
  # Clean Gemfile.lock
  Dir.glob("#{cpath}/**/Gemfile.lock").each{|gd| FileUtils.rm_rf gd}
end

CLEAN.include("cookbooks", "Gemfile.lock", "tmp", "pkg", "iso", "boxes", \
              "definitions/*/output-*", "definitions/*/packer_cache", ".bundle", ".vagrant")

boxlist = FileList.new
Dir.glob("definitions/*").each do |dfntn|
  vm = dfntn.split("/")[1]
  box = vm + ".box"
  boxlist.add("boxes/#{box}")
  desc "Build #{box} from #{dfntn}"
  file "boxes/#{box}" => FileList["#{dfntn}/*"] do |t|
    Dir.chdir dfntn do
      sh "packer build #{vm}.json"
      FileUtils.mv "#{vm}.box", "../../boxes/"
    end
  end
end

desc "Generate Vagrant boxes"
file "baseboxes" => [ "boxes"] +  boxlist

desc "Populate cookbooks"
task :berkshelf  do
  sh "bundle check || bundle install"
  FileUtils.rm_rf "cookbooks"
  sh "bundle exec berks vendor cookbooks"
  artclean "cookbooks"
end

desc "Prepare and pack chef bundle"
task :pack => ["berkshelf", "pkg"] do
  sh "tar -czf pkg/#{pkgname}.tar.gz cookbooks conf roles data_bags nodes Rakefile"
end

desc "Prepare and pack chef bundle quickly"
task :qpack  do
  sh "tar -czf pkg/#{pkgname}.tar.gz cookbooks conf roles data_bags nodes Rakefile"
end

desc "Regenerate cookbooks"
task :regen  do
  sh "rm Berksfile.lock || echo 'No berkshelf lock found'"
  Rake::Task["berkshelf"].execute
  Rake::Task["pack"].execute
end

desc "Prepare dev env"
task :default => ["berkshelf", "pack"]

desc "Copy artifacts to local web server"
task :install do
  instdest = ENV["DEST"] ? ENV["DEST"] : "/srv/www"
  File.directory?("#{instdest}/chef/") || Dir.mkdir("#{instdest}/chef/")
  File.directory?("#{instdest}/chef/nodes/") || Dir.mkdir("#{instdest}/chef/nodes/")
  File.directory?("#{instdest}/chef/conf/") || Dir.mkdir("#{instdest}/chef/conf/")
  FileUtils.cp_r Dir.glob("pkg/*") ,"#{instdest}/chef/"
  FileUtils.cp_r Dir.glob("nodes/*") ,"#{instdest}/chef/nodes"
  FileUtils.cp_r Dir.glob("conf/*") ,"#{instdest}/chef/conf"
end

