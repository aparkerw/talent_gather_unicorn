require './lib/release_notes_to_html_converter.rb'

path_to_file = 'spec/samples/release_notes_sample_full.txt'
ReleaseNotesToHtmlConverter.parse_release_notes(path_to_file)