# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new do |t|
  t.files   = ['lib/**/*.rb', 'epubmeta.rb', '-', 'REAMDE.rdoc']
  #t.options = ['--any', '--extra', '--opts']
end

Rake::Task['console'].clear
task :console do
  sh "irb -I lib -r 'epubmeta'"
end
