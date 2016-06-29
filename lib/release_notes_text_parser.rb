class ReleaseNotesTextParser

  def self.get_version_sections(release_notes_text)
    []
  end

  def self.get_version_number(version_section_text)
    # \d+\.\d+\.\d+ \*+
    match = /(\d+\.\d+\.\d+) \*+/.match(version_section_text)
    match[1] if match
  end

  def self.get_feature_sections(version_section_text)
    # (feature changes|bug fixes|small tweaks)\n((• .*\n)+)?
    "this is wrong"
  end

  def self.get_feature_items(feature_section_items)
    #(• .*\n)+
    "this is wrong"
  end

end
