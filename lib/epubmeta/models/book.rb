module EPUBMeta
  module Models
    class Book
      # Titles, array of String instances ({http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.2.1 EPUB2 reference})
      # @return [Array]
      attr_accessor :titles
      def titles; @titles || []; end

      # Creators, array of Person instances ({http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.2.2 EPUB2 reference})
      # @return [Array]
      attr_accessor :creators
      def creators; @creators || []; end

      # Subjects, array of String instances ({http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.2.3 EPUB2 reference})
      # @return [Array]
      attr_accessor :subjects
      def subjects; @subjects || []; end

      # Description ({http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.2.4 EPUB2 reference})
      # @return [String]
      attr_accessor :description

      # Publisher ({http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.2.5 EPUB2 reference})
      # @return [String]
      attr_accessor :publisher

      # Contributors, array of Person instances ({http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.2.6 EPUB2 reference})
      # @return [Array]
      attr_accessor :contributors
      def contributors; @contributors || []; end

      # Dates, array of Date instances ({http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.2.7 EPUB2 reference})
      # @return [Array]
      attr_accessor :dates
      def dates; @dates || []; end

      # Identifiers, array of Identifier instances ({http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.2.10 EPUB2 reference})
      # @return [Array]
      attr_accessor :identifiers
      def identifiers; @identifiers || []; end

      # Fixed layout
      # @return [Boolean]
      attr_accessor :fixed_layout
      def fixed_layout; @fixed_layout || false; end
      alias :fixed_layout? :fixed_layout

      # Source ({http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.2.11 EPUB2 reference})
      # @return [String]
      attr_accessor :source

      # Languages, array of String instances ({http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.2.12 EPUB2 reference})
      # @return [Array]
      attr_accessor :languages
      def languages; @languages || []; end

      # Rights ({http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section2.2.15 EPUB2 reference})
      # @return [String]
      attr_accessor :rights

      # DRM protected
      # @return [Boolean]
      attr_accessor :drm_protected
      def drm_protected; @drm_protected || false; end
      alias :drm_protected? :drm_protected

      # Cover
      # @return [Cover]
      attr_accessor :cover

      # EPUB Version ({http://idpf.org/epub/20/spec/OPF_2.0.1_draft.htm#Section1.4.1.2})
      # @return [String]
      attr_accessor :version

      # Should never be called directly, go through EPUBMeta.get
      def initialize(parser)
        document = parser.metadata_document
        return if document.nil?
        document.remove_namespaces!
        metadata = document.css('metadata')
        self.version = document.css('package')[0]['version']
        self.titles = metadata.xpath('.//title').map(&:content)
        self.creators = metadata.xpath('.//creator').map {|c| EPUBMeta::Models::Person.new(c) }
        self.subjects = metadata.xpath('.//subject').map(&:content)
        self.description = metadata.xpath('.//description').first.content rescue nil
        self.publisher = metadata.xpath('.//publisher').first.content rescue nil
        self.contributors = metadata.xpath('.//contributor').map {|c| EPUBMeta::Models::Person.new(c) }
        self.dates = metadata.xpath('.//date').map { |d| EPUBMeta::Models::Date.new(d) }
        modified_date = metadata.xpath(".//meta[@property='dcterms:modified']").map do |d|
          date = EPUBMeta::Models::Date.new(d)
          date.event = 'modification'
          date
        end
        self.dates += modified_date;
        self.identifiers = metadata.xpath('.//identifier').map { |i| EPUBMeta::Models::Identifier.new(i) }
        self.source = metadata.xpath('.//source').first.content rescue nil
        self.languages = metadata.xpath('.//language').map(&:content)
        self.rights = metadata.xpath('.//rights').first.content rescue nil
        self.drm_protected = parser.drm_protected?
        self.cover = EPUBMeta::Models::Cover.new(parser)

        rendition_element = metadata.xpath(".//meta[@property='rendition:layout']").first
        if rendition_element.nil?
          self.fixed_layout = false
        else
          self.fixed_layout = rendition_element.content == "pre-paginated"
        end
      end


      # Returns Hash representation of the book
      # @return [Hash]
      def to_hash
        {
          :titles => @titles,
          :creators => @creators.map(&:to_hash),
          :subjects => @subjects,
          :description => @description,
          :publisher => @publisher,
          :contributors => @contributors.map(&:to_hash),
          :dates => @dates.map(&:to_hash),
          :identifiers => @identifiers.map(&:to_hash),
          :source => @source,
          :languages => @languages,
          :rights => @rights,
          :drm_protected => @drm_protected,
          :fixed_layout => @fixed_layout,
          :cover => @cover,
        }
      end
    end
  end
end

