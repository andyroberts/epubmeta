# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "epubmeta"
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Roberts"]
  s.date = "2018-10-09"
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
  s.add_dependency(%q<rubyzip>, [">= 1.2.2"])
  s.add_dependency(%q<nokogiri>, [">= 1.8.2"])
  s.add_dependency(%q<rspec>, ["~> 2.14.1"])
  s.add_dependency(%q<yard>, ["~> 0.9.11"])
  s.add_dependency(%q<redcarpet>, [">= 0"])
end