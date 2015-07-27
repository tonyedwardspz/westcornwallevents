module ApplicationHelper
  def youtube_parse(html)
    #[youtube ""]
    matches = html.match /\[youtube "([a-zA-Z0-9_-]*)"\]/i

    return unless matches.size == 2

    youtube_code = matches[1]


    injected_html = <<-EOF
  <div class="video-container">
    <iframe src="http://www.youtube.com/embed/#{youtube_code}" frameborder="0" width="560" height="315"></iframe>
  </div>
EOF

    html.gsub /\[youtube "#{youtube_code}"\]/i, injected_html
  end
end
