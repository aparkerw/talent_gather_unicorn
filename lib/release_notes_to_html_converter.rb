require_relative 'release_notes_text_parser'

class ReleaseNotesToHtmlConverter

  def self.hello_world(input = '')
    "hello world! #{input.to_s}"
  end

  def self.parse_release_notes(path_to_file)
    # load the file
    content = File.read(path_to_file)
    html_file = open('output.html', 'w')


    html_file.puts "<html>"
    write_header html_file

    # call parser and get the pieces
    versions = ReleaseNotesTextParser.get_version_sections(content)
    versions.each do |version|
      # get the sections
      version_number = ReleaseNotesTextParser.get_version_number(version.first)
      html_file.puts "<b>#{version_number}</b>"
      sections = ReleaseNotesTextParser.get_feature_sections(version.first)
      html_file.puts "<ul>"
      sections.each do |section|
        html_file.puts "<b>#{section[:name]}</b>"
        html_file.puts "<ul>"
        items = ReleaseNotesTextParser.get_feature_items(section[:items])
        items.each do |item|
          html_file.puts "<li>#{item[0].gsub(/• /,'')}</li>"
        end
        html_file.puts "</ul>"
       end
       html_file.puts "</ul>"
      #loop and get the items
    end
    html_file.puts "</html>"
    # turn them to html
    html_file.close();
  end

  def self.write_header(html_file)
    html_file.puts '<head><meta charset="UTF-8"><style type="text/css">body {font-family:\'helvetica neue\'; }</style></head>'
  end
 
end


=begin
<div class="medium-12 small-12 columns">

                <b>0.7.7</b>
                <ul>
                    <b>Features</b>
                    <ul>
                        <li>resume images can now be rotated after capture</li>
                    </ul>
                </ul>

                <ul>
                    <b>Bug Fixes</b>
                    <ul>
                        <li>event allows rejoin when the permissions has been revoked</li>
                        <li>it redirects the user to events screen when user stops contributing from the event view</li>
                    </ul>
                </ul>

                <ul>
                    <b>Small Tweaks</b>
                    <ul>
                        <li>forward student now shows the resume summary when available</li>
                        <li>improved image capture menu and interface</li>
                        <li>app prompts before removal of collaborator from event</li>
                        <li>student forward data now aligns with event's questions</li>
                        <li>during resume processing the phones will not enter sleep mode</li>
                        <li>fixed parsing hanging and improved quality of parsing</li>
                    </ul>
                </ul>

                <b>0.7.6</b>
                <ul>
                    <b>Bug Fixes</b>
                    <ul>
                        <li>fixed login issue some users were experiencing</li>
                        <li>fixed event access issue for iOS 8 users introduced in 0.7.5</li>
                        <li>fixed clear input issue in student filter</li>
                    </ul>
                </ul>

                <ul>
                    <b>Small Tweaks</b>
                    <ul>
                        <li>event export has distinct columns for each program in the event for better sorting</li>
                        <li>event export now allows toggle of resume text export</li>
                        <li>app prompts before rejecting event invite</li>
                    </ul>
                </ul>


                <b>0.7.5</b>
                <ul>
                    <b>Features</b>
                    <ul>
                        <li>candidates saved locally and synchronized later in case of poor network connectivity</li>
                    </ul>
                </ul>

                <ul>
                    <b>Small Tweaks</b>
                    <ul>
                        <li>imporved resume capture control interface</li>
                    </ul>
                </ul>


                <b>0.7.4</b>
                <ul>
                    <b>Bug fixes</b>
                    <ul>
                        <li>interviews save from interview screen not from candidate detail screen</li>
                        <li>updating the date of an event now saves correctly</li>
                    </ul>
                </ul>

                <ul>
                    <b>Small Tweaks</b>
                    <ul>
                        <li>increased offline event details accessibility</li>
                        <li>registration requires email confirmation</li>
                        <li>diagnostic screen works better when not logged in</li>
                    </ul>
                </ul>

                <b>0.7.3</b>
                <ul>
                    <li>addressed android image rotate bug</li>
                    <li>event create list placeholder text now contextual</li>
                    <li>better diagnostic display for devices that don't support disc space check (iOS)</li>
                </ul>

                <b>0.7.2</b>
                <ul>
                    <li>fixed event create bug</li>
                </ul>

                <b>0.7.1</b>
                <ul>
                    <li>fixed event create bug</li>
                </ul>

                <b>0.7.0</b>
                <ul>
                    <b>Features</b>
                    <ul>
                        <li>view processing status right from the candidates list</li>
                        <li>simpler sign-in screen</li>
                        <li>simpler event create list interface for (skills, programs, relocation)</li>
                        <li>now see automatic summary data of candidate resume information</li>
                        <li>new diagnostics screen to analyze the operational health of the app</li>
                        <li>event details: start/end time, address, description, parking</li>
                        <li>see event on a map and get driving directions</li>
                    </ul>
                </ul>

                <ul>
                    <b>Bug fixes</b>
                    <ul>
                        <li>unpredictable navigation issue for iOS 9 users fixed</li>
                    </ul>
                </ul>

                <ul>
                    <b>Small Tweaks</b>
                    <ul>
                        <li>better email extraction logic</li>
                        <li>processing bar does not show on other candidate views</li>
                        <li>cancel event create prompts for confirmation so data is not lost</li>
                        <li>prevent swipe-back on resume image screen</li>
                        <li>candidate names are now uniformly capitalized (BOB becomes Bob)</li>
                        <li>touch candidates top to scroll to top of the view</li>
                        <li>process resume images from the candidates list</li>
                        <li>imporved perfomance in poor/no network situations</li>
                    </ul>
                </ul>
            </div>
=end