#!/usr/bin/env ruby

require 'json'

# Usage:
# ssl2json.rb <filedname> <filepath>

puts JSON[Hash[Hash[*ARGV].map { |k,v| [k, File.read(v)] }]]
