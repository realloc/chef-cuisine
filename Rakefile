# -*- coding: utf-8 -*-
# -*- ruby -*-
require 'rake'
require 'rake/clean'
require 'fileutils'

directory 'cookbooks.solo'
directory 'pkg'
directory 'boxes'

desc "Artifact cleaner"
def artclean(cpath)
  # Clean git
  Dir.glob("#{cpath}/**/.git").each{|gd| FileUtils.rm_rf gd}
end

CLEAN.include("cookbooks", "cookbooks.solo", "*.lock", "tmp", "pkg", "iso", "boxes")

boxlist = FileList.new
Dir.glob("definitions/*").each do |dfntn|
  vm = dfntn.split("/")[1]
  box = vm + ".box"
  boxlist.add("boxes/#{box}")
  desc "Build #{box} from #{dfntn}"
  file "boxes/#{box}" => FileList["#{dfntn}/*"] do |t|
    sh "vagrant basebox build #{vm} -a -n -f"    
    sh "VBoxManage controlvm #{vm} poweroff"
    Dir.chdir "boxes" do
      sh "vagrant basebox export #{vm} -f"    
    end
    sh "VBoxManage unregistervm #{vm} --delete"
  end
end

desc "Generate Vagrant boxes"
file "baseboxes" => [ "boxes", boxlist ]

desc "Regenerate local repository metadata"
task :repos do
  Dir.chdir "repos/debian" do
    sh "wget -nc -i down.list"
    sh "dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz"
    sh "dpkg-scansources . /dev/null | gzip -9c > Sources.gz"
  end
end

desc "Populate cookbooks.solo"
task :solo => ["cookbooks.solo"] do
  tmpdir=`mktemp -d -t XXXXXXX,`.chomp
  puts "Using tmpdir #{tmpdir}"
  FileUtils.cp  "Cheffile.solo", tmpdir+"/Cheffile"
  FileUtils.cp  "Gemfile", tmpdir
  Dir.chdir tmpdir do
    sh "bundle install"
    sh "bundle exec librarian-chef install"
  end  
  FileUtils.cp_r Dir.glob(tmpdir +"/cookbooks/*"), "cookbooks.solo"
  FileUtils.rm_rf tmpdir
  artclean "cookbooks.solo"
end

desc "Populate cookbooks"
task :client  do
  sh "bundle install"
  sh "bundle exec librarian-chef install"
  artclean "cookbooks"
end

desc "Prepare and pack chef-client bundle"
task :pack => ["client", "pkg"] do
  sh "tar -czf pkg/#{File.basename(Dir.pwd)}.tar.gz cookbooks environments roles data_bags Rakefile"
end

desc "Prepare and pack chef-solo bundle"
task :spack => ["solo", "pkg"] do
  sh "tar -czf pkg/chef-solo.tar.gz --transform 's%^cookbooks.solo%cookbooks%' cookbooks.solo roles data_bags"
end

desc "Prepare and pack chef-client bundle quickly"
task :qpack  do
  sh "tar -czf pkg/#{File.basename(Dir.pwd)}.tar.gz cookbooks environments roles data_bags Rakefile"
end

desc "Prepare and pack chef-solo bundle quickly"
task :qspack  do
  sh "tar -czf pkg/chef-solo.tar.gz --transform 's%^cookbooks.solo%cookbooks%' cookbooks.solo roles data_bags"
end

desc "Prepare dev env" 
task :default => ["repos", "client", "pack", "solo", "spack"]

desc "Upload kitchen contents to local Chef Server"
task :upchef do
  sh "knife cookbook upload -a -o cookbooks/"
  sh <<-EOH
    for bag in `ls data_bags/`; do
    knife data bag create $bag
    knife data bag from file $bag data_bags/$bag/
    done
  EOH
  sh "knife role from file roles/*"
  sh "knife environment from file environments/*"
end

desc "Copy artifacts to local web server"
task :install do
  instdest = ENV["DEST"] ? ENV["DEST"] : "/srv/www"
  FileUtils.cp_r Dir.glob("pkg/*") ,"#{instdest}/chef/"
  FileUtils.cp_r Dir.glob("nodes/*") ,"#{instdest}/chef/"
  # copy repos here because of possible permissions problem.
  Dir.glob("repos").each do |repo|
    FileUtils.cp_r repo ,"#{instdest}/chef/"
  end
end
