# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "epubmeta"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrew Roberts"]
  s.date = "2018-08-10"
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
  s.rubygems_version = "2.0.3"
  s.summary = "Extracts metadata information from EPUB files"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rubyzip>, [">= 1.0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.4.2"])
      s.add_development_dependency(%q<rspec>, ["~> 2.14.1"])
      s.add_development_dependency(%q<yard>, ["~> 0.8.7"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<redcarpet>, [">= 0"])
    else
      s.add_dependency(%q<rubyzip>, [">= 1.0"])
      s.add_dependency(%q<nokogiri>, [">= 1.4.2"])
      s.add_dependency(%q<rspec>, ["~> 2.14.1"])
      s.add_dependency(%q<yard>, ["~> 0.8.7"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<redcarpet>, [">= 0"])
    end
  else
    s.add_dependency(%q<rubyzip>, [">= 1.0"])
    s.add_dependency(%q<nokogiri>, [">= 1.4.2"])
    s.add_dependency(%q<rspec>, ["~> 2.14.1"])
    s.add_dependency(%q<yard>, ["~> 0.8.7"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<redcarpet>, [">= 0"])
  end
end

