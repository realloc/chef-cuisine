# -*- coding: utf-8 -*-
# -*- mode: ruby -*-
require 'rake'
require 'rake/clean'
require 'fileutils'
require 'chef/role'

directory 'cookbooks'
directory 'pkg'
directory 'boxes'

pkgname = ENV['CUISINEPKG'] || File.basename(Dir.pwd)

desc 'Artifact cleaner'
def artclean(cpath)
  # Clean git
  Dir.glob("#{cpath}/**/.git").each { |gd| FileUtils.rm_rf gd }
  # Clean Gemfile.lock
  Dir.glob("#{cpath}/**/Gemfile.lock").each { |gd| FileUtils.rm_rf gd }
end

CLEAN.include('cookbooks',
              'Gemfile.lock',
              'tmp',
              'pkg',
              'iso',
              'boxes',
              'roles/*.json',
              'definitions/*/output-*',
              'definitions/*/packer_cache',
              '.bundle',
              '.vagrant')

boxlist = FileList.new
Dir.glob('definitions/*').each do |dfntn|
  vm = dfntn.split('/')[1]
  box = vm + '.box'
  boxlist.add("boxes/#{box}")
  desc "Build #{box} from #{dfntn}"
  file "boxes/#{box}" => FileList["#{dfntn}/*"] do |_t|
    Dir.chdir dfntn do
      sh "packer build #{vm}.json"
      FileUtils.mv "#{vm}.box", '../../boxes/'
    end
  end
end

desc 'Generate Vagrant boxes'
file 'baseboxes' => ['boxes'] + boxlist

desc 'Populate cookbooks'
task :berkshelf do
  sh 'bundle check || bundle install'
  FileUtils.rm_rf 'cookbooks'
  sh 'bundle exec berks vendor cookbooks'
  artclean 'cookbooks'
end

desc 'Prepare and pack chef bundle'
task pack: %w(berkshelf pkg roles_to_json) do
  sh "tar -czf pkg/#{pkgname}.tar.gz --exclude='clients/*.pem' cookbooks conf roles/*.json data_bags nodes clients"
end

desc 'Prepare and pack chef bundle quickly'
task :qpack do
  sh "tar -czf pkg/#{pkgname}.tar.gz --exclude='clients/*.pem' cookbooks conf roles/*.json data_bags nodes clients"
end

desc 'Regenerate cookbooks'
task :regen do
  sh 'rm Berksfile.lock || echo No berkshelf lock found'
  Rake::Task['berkshelf'].execute
  Rake::Task['pack'].execute
end

desc 'Upload data to Chef Server'
task :upload do
  sh 'berks upload'
  sh 'knife role from file roles/*.rb'
  sh 'knife environment from file environments/*.rb'
  Dir.glob('data_bags/*') do |bag|
    bag_name = bag.split('/')[1]
    sh "knife data bag create #{bag_name}"
    sh "knife data bag from file #{bag_name} #{bag}/*.json"
  end
  sh 'knife node from file nodes/*.json'
end

desc 'Convert ruby roles from ruby to json, creating/overwriting json files.'
task :roles_to_json do
  Dir.glob('roles/*.rb') do |rb_file|
    role = Chef::Role.new
    role.from_file(rb_file)
    json_file = rb_file.sub(/\.rb$/, '.json')
    File.open(json_file, 'w') { |f| f.write(JSON.pretty_generate(role)) }
  end
end

desc 'Prepare dev env'
task default: %w(berkshelf pack)

desc 'Copy artifacts to local web server'
task :install do
  instdest = ENV['DEST'] ? ENV['DEST'] : '/srv/www'
  File.directory?("#{instdest}/chef/") || Dir.mkdir("#{instdest}/chef/")
  File.directory?("#{instdest}/chef/nodes/") || Dir.mkdir("#{instdest}/chef/nodes/")
  File.directory?("#{instdest}/chef/conf/") || Dir.mkdir("#{instdest}/chef/conf/")
  FileUtils.cp_r Dir.glob('pkg/*'), "#{instdest}/chef/"
  FileUtils.cp_r Dir.glob('nodes/*'), "#{instdest}/chef/nodes"
  FileUtils.cp_r Dir.glob('conf/*'), "#{instdest}/chef/conf"
end
