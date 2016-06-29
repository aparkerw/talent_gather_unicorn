require 'release_notes_text_parser'


RSpec.describe ReleaseNotesTextParser, '#get_version_sections' do
  let(:sample_text) { File.read('spec/samples/release_notes_sample_full.txt') }
  context 'with version text' do
    it 'returns all the expected sections' do
      #expect the sample file to have given us 24 sections 
      version_sections = ReleaseNotesTextParser.get_version_sections(sample_text)
      expect(version_sections.length).to eq 24
    end
  end
  context 'without text' do
    it 'does not throw errors' do
      # should not have an exception thrown
    end
  end
end

RSpec.describe ReleaseNotesTextParser, '#get_version_number' do
  let(:sample_text_single) { File.read('spec/samples/release_notes_sample_small.txt') }
  context 'with valid version text' do
    it 'returns the version correctly' do
      version_number = ReleaseNotesTextParser.get_version_number(sample_text_single)
      expect(version_number).to eq "0.3.0"
    end
  end
  context 'without version text' do
    it 'returns nil' do
      version_number = ReleaseNotesTextParser.get_version_number('empty string without version')
      expect(version_number).to be_nil
    end
  end
end

RSpec.describe ReleaseNotesTextParser, '#get_feature_sections' do
  let(:sample_text_single) { File.read('spec/samples/release_notes_sample_small.txt') }
  context 'with valid version text' do
    it 'returns 3 sections when 3 are given' do
      feature_sections = ReleaseNotesTextParser.get_feature_sections(sample_text_single)
      expect(feature_sections.length).to eq 3
    end
    it 'returns the correct 3 sections if given 3' do
      feature_sections = ReleaseNotesTextParser.get_feature_sections(sample_text_single)
      expect(feature_sections.map {|section| section.name }).to eq ["Bug Fixes", "Small Tweaks", "Features"]
    end
    context 'bullet points' do
      it 'passes back bullet points when they exist' do
        feature_sections = ReleaseNotesTextParser.get_feature_sections(sample_text_single)
        expect(feature_sections.first.items.index('• Improved User Interface')).to eq 0
      end
      it 'passes back nil when there are no bullet points' do
        feature_sections = ReleaseNotesTextParser.get_feature_sections('0.3.0 ***************\nFeatures\n\nBug Fixes\n\nSmall Tweaks')
        expect(feature_sections.first.items).to be_nil
      end
    end
  end
  context 'without version section text' do
    it 'returns empty array' do
      feature_sections = ReleaseNotesTextParser.get_feature_sections('0.3.0 *************\n')
      expect(feature_sections).to eq []
    end
  end
end

RSpec.describe ReleaseNotesTextParser, '#get_feature_items' do
  let(:sample_text_items) { File.read('spec/samples/feature_items_list_sample.txt') }
  context 'with valid section body text' do
    it 'returns each line of text of the section when section is requested' do
      feature_items = ReleaseNotesTextParser.get_feature_items(sample_text_items)
      expect(feature_items.length).to eq 6
    end
    it 'returns an empty array if there are no feature lines' do
      feature_items = ReleaseNotesTextParser.get_feature_items('')
      expect(feature_items.length).to be_nil
    end
    it 'doesn\'t return lines missing bullet points' do 
      feature_items = ReleaseNotesTextParser.get_feature_items('line 1\n• line2\nline3')
      expect(feature_items.length).to eq 1
    end 
  end
end
