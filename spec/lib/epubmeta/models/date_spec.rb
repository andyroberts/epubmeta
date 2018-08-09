require 'spec_helper'

describe EPUBMeta::Models::Date do
  describe '#initialize' do
    subject { EPUBMeta::Models::Date.new(Nokogiri::XML(File.new('spec/support/xml/metamorphosis_metadata_epub2.opf')).remove_namespaces!.css('metadata').xpath('.//date').first) }

    its(:date) { should == Date.new(2005, 8, 17) }
    its(:date_str) { should == '2005-08-17' }
    its(:event) { should == 'publication' }
  end

  describe '#to_hash' do
    context 'keys' do
      subject { EPUBMeta::Models::Date.new(Nokogiri::XML(File.new('spec/support/xml/metamorphosis_metadata_epub2.opf')).remove_namespaces!.css('metadata').xpath('.//date').first).to_hash.keys }
      it { should include :time }
      it { should include :event }
    end
  end
end
