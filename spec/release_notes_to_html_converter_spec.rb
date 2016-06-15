require 'release_notes_to_html_converter'

RSpec.describe ReleaseNotesToHtmlConverter, '#hello_world' do
  
  context 'with input' do
    it 'says hello world with the input' do
      converter = ReleaseNotesToHtmlConverter.new();
      message = converter.hello_world('Unicorn')
      expect(message).to eq 'hello world! Unicorn'
    end
    it 'says hello world with the input as a number' do
      converter = ReleaseNotesToHtmlConverter.new();
      message = converter.hello_world(2)
      expect(message).to eq 'hello world! 2'
    end
    it 'says hello world with the input as a number' do
      converter = ReleaseNotesToHtmlConverter.new();
      message = converter.hello_world()
      expect(message).to eq 'hello world! '
    end
  end

end
