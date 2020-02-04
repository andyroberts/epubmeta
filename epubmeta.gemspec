# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "epubmeta"
  s.version = "0.5.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Roberts"]
  s.date = "2019-11-26"
  s.description = "Supports EPUB2 and EPUB3 formats."
  s.email = "andy.roberts.uk@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "lib/epubmeta.rb",
    "lib/epubmeta/models/book.rb",
    "lib/epubmeta/models/cover.rb",
    "lib/epubmeta/models/date.rb",
    "lib/epubmeta/models/identifier.rb",
    "lib/epubmeta/models/person.rb",
    "lib/epubmeta/parser.rb",
    "lib/epubmeta/utils.rb"
  ]
  s.homepage = "https://github.com/andyroberts/epubmeta"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.summary = "Extracts metadata information from EPUB files"
  s.required_ruby_version = '>= 1.9.2'
  s.add_runtime_dependency 'rubyzip', '>= 1.2.2', '< 3.0'
  s.add_runtime_dependency 'nokogiri', '~> 1.10', '>= 1.10.4'
  s.add_development_dependency 'rspec', '~> 2.14', '>= 2.14.1'
  s.add_development_dependency 'yard', '~> 0.9.20'
end