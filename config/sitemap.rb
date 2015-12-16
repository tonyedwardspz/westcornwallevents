# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://westcornwallevents.co.uk"
SitemapGenerator::Sitemap.sitemaps_path = 'shared/'

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add events_path, :priority => 0.7, :changefreq => 'daily'
  Event.find_each do |event|
    add event_path(event), :lastmod => event.updated_at
  end

  add festivals_path, :priority => 0.7, :changefreq => 'weekly'
  Festival.find_each do |festival|
    add festival_path(festival), :lastmod => festival.updated_at
  end

  add venues_path, :priority => 0.7, :changefreq => 'weekly'
  Venue.find_each do |venue|
    add venue_path(venue), :lastmod => venue.updated_at
  end

  add pages_path, :priority => 0.4, :changefreq => 'monthly'
  Page.find_each do |page|
    add page_path(page), :lastmod => page.updated_at
  end
end
