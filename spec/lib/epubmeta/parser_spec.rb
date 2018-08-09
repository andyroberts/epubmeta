require 'spec_helper'

describe EPUBMeta::Parser do
  let(:epub_path) { File.expand_path('spec/support/binary/metamorphosis_epub2.epub') }
  subject { EPUBMeta::Parser.parse(epub_path) }

  it 'exposes the path' do
    subject.path.should == epub_path
  end

  it 'exposes the correct metadata document' do
    subject.metadata_document.should be_kind_of Nokogiri::XML::Document
    id_node = subject.metadata_document.xpath('//dc:identifier').first
    id_node.content.should == 'http://www.gutenberg.org/ebooks/5200'
  end

  it 'returns true for drm protected files' do
    drm_path = 'spec/support/binary/metamorphosis_epub2_drm.epub'
    parser = EPUBMeta::Parser.parse(drm_path)
    parser.drm_protected?.should be_true
  end

  it 'returns false for non-drm protected files' do
    non_drm_path = 'spec/support/binary/metamorphosis_epub2.epub'
    parser = EPUBMeta::Parser.parse(non_drm_path)
    parser.drm_protected?.should be_false
  end

  context 'unsupported file types' do
    it 'raises NotAnEPUBFileError when zip but no epub file' do
      lambda do
        zip_path = 'spec/support/binary/zip_file.zip'
        parser = EPUBMeta::Parser.parse(zip_path)
        parser.metadata_document
      end.should raise_error(EPUBMeta::NotAnEPUBFileError)
    end

    it 'raises NotAnEPUBFileError when not even zip file' do
      lambda do
        image_path = 'spec/support/binary/cover.jpg'
        parser = EPUBMeta::Parser.parse(image_path)
        parser.metadata_document
      end.should raise_error(EPUBMeta::NotAnEPUBFileError)
    end
  end
end

