require 'zip'
require 'nokogiri'
require 'cgi'

require 'epubmeta/parser'
require 'epubmeta/models/book'
require 'epubmeta/models/cover'
require 'epubmeta/models/person'
require 'epubmeta/models/date'
require 'epubmeta/models/identifier'
require 'epubmeta/utils'

module EPUBMeta
  # Parses an epub file and returns a Book instance.
  # @return [EPUBMeta::Models::Book] a model representation of the epub file
  def self.get(path)
    parser = EPUBMeta::Parser.parse(path)
    EPUBMeta::Models::Book.new(parser)
  end
end
