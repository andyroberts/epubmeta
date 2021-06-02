module EPUBMeta
  class Parser
    attr_accessor :path, :metadata_document

    def self.parse(path)
      epubmeta = EPUBMeta::Parser.new
      epubmeta.path = path
      epubmeta
    end

    def metadata_document
      @metadata_document ||= load_metadata_file
    end

    def drm_protected?
      @drm_protected ||= !!zip_file.find_entry('META-INF/rights.xml')
    end

    def zip_file
      begin
        @zip_file ||= Zip::File.open(@path)
      rescue Zip::Error => e
        raise NotAnEPUBFileError.new(e)
      end
    end

    def metadata_path
      @metadata_path ||= get_full_path(root_document)
    end

    def get_full_path(container_root_doc)
      container_root_doc.remove_namespaces!
      container_root_doc.css('container rootfiles rootfile:first-child').attribute('full-path').content
    end

    private

    def root_document
      begin
        @root_document ||= Nokogiri::XML(zip_file.read('META-INF/container.xml'))
      rescue => e
        raise NotAnEPUBFileError.new(e)
      end
    end

    def load_metadata_file
      Nokogiri::XML(zip_file.read(metadata_path))
    end
  end
end
