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
  	version_section_text.scan(/((?:Features|Bug Fixes|Small Tweaks)\n(?:(?:• .*\n)+))/)
  end

  def self.get_feature_items(feature_section_items)
    #(• .*\n)+
    match = /(• .*\n)+/.match(feature_section_text)
    match[1] if match
  end

end
