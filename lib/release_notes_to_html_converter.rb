require './release_notes_text_parser.rb'

class ReleaseNotesToHtmlConverter

  def self.hello_world(input = '')
    "hello world! #{input.to_s}"
  end

  def self.parse_release_notes
    # load the file
    content = File.read('../spec/samples/release_notes_sample_full.txt');
    puts content;
    # call parser 
    # get the pieces
    # turn them to html
    # write the output
    File.write('sample_output.txt', content);
  end

end


# irb
# require './release_notes_to_html_converter.rb'
# ReleaseNotesToHtmlConverter.parse_release_notes