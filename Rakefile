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

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "epubmeta"
  gem.homepage = "https://github.com/andyroberts/epubmeta"
  gem.license = "MIT"
  gem.summary = %Q{Extracts metadata information from EPUB files}
  gem.description = %Q{Supports EPUB2 and EPUB3 formats.}
  gem.email = "andy.roberts.uk@gmail.com"
  gem.authors = ["Andrew Roberts"]
  gem.files = Dir.glob('lib/**/*.rb')
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

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
