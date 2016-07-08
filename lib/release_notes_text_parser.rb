class ReleaseNotesTextParser

  def self.get_version_sections(release_notes_text)
 	release_notes_text.scan(/((?:\d+\.){2}\d+\ \**\n(?:.*\n)+?(?=\d+\.\d+\.\d))/)
  end

  def self.get_version_number(version_section_text)
    # \d+\.\d+\.\d+ \*+
    match = /(\d+\.\d+\.\d+) \*+/.match(version_section_text)
    match[1] if match
  end

  def self.get_feature_sections(version_section_text)
  	matches = version_section_text.scan(/((Features|Bug Fixes|Small Tweaks)\n((?:• .*\n)+))/)
    sections = []
    matches.each do |match|
      sections << {:name => match[1],:items => match[2]}
    end
    sections
  end

  def self.get_feature_items(feature_section_items)
    #(• .*\n)+
    feature_section_items.scan(/(• .*)+/)
  end

end
