require 'release_notes_text_parser'

RSpec.describe ReleaseNotesTextParser, '#get_version_sections' do
  context 'with version text' do
    it 'returns all the expected sections' do
      #expect the sample file to have given us 24 sections 
    end
  end
  context 'without text' do
    it 'does not throw errors' do
      # should not have an exception thrown
    end
  end
end

RSpec.describe ReleaseNotesTextParser, '#get_version_number' do
  context 'with valid version text' do
    it 'returns the version correctly' do
      # expect the version to be 0.3.0?
    end
  end
  context 'without version text' do
    it 'returns nil' do
      #returns nil 
    end
  end
end

RSpec.describe ReleaseNotesTextParser, '#get_feature_sections' do
  context 'with valid version text' do
    it 'returns 3 sections when 3 are given' do
      # expect the version to be 0.3.0?
    end
    it 'returns the correct 3 sections if given 3' do
      # expect the version to be 0.3.0?
    end
    context 'bullet points' do
      it 'passes back bullet points when they exist' do
      end
      it 'passes back nil when there are no bullet points' do
      end
    end
  end
  context 'without version section text' do
    it 'returns empty array' do
      #returns []
    end
  end
end

RSpec.describe ReleaseNotesTextParser, '#get_feature_items' do

end

