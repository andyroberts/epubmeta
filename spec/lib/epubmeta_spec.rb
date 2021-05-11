require 'spec_helper'

describe EPUBMeta do
  let(:epub_path) { File.expand_path('spec/support/binary/metamorphosis_epub2.epub') }

  describe '#get' do
    it 'calls parser' do
      document = EPUBMeta::Parser.parse(epub_path).metadata_document
      parser = double
      parser.stub(:metadata_document)
      parser.stub(:drm_protected?)
      EPUBMeta::Parser.should_receive(:parse) { parser }
      EPUBMeta.get(epub_path)
    end

    it 'instantiates a book model and returns it' do
      book_mock = double
      EPUBMeta::Models::Book.should_receive(:new) { book_mock }
      EPUBMeta.get(epub_path).should == book_mock
    end
  end
end
