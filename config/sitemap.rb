SitemapGenerator::Sitemap.default_host = "https://westcornwallevents.co.uk"
SitemapGenerator::Sitemap.sitemaps_path = 'shared/'

SitemapGenerator::Sitemap.create do
  add root_path, :priority => 0.9, :changefreq => 'daily'

  add events_path, :priority => 0.7, :changefreq => 'daily'
  Event.find_each do |event|
    add event_path(event), :lastmod => event.updated_at
  end

  add festivals_path, :priority => 0.7, :changefreq => 'weekly'
  Festival.find_each do |festival|
    add festival_path(festival), :lastmod => festival.updated_at
  end

  add venues_path, :priority => 0.5, :changefreq => 'weekly'
  Venue.find_each do |venue|
    add venue_path(venue), :lastmod => venue.updated_at
  end

  add blogs_path, :priority => 0.6, :changefreq => 'weekly'
  Blog.find_each do |blog|
    add blog_path(blog), :lastmod => blog.updated_at
  end

  add pages_path, :priority => 0.4, :changefreq => 'monthly'
  Page.find_each do |page|
    add page_path(page), :lastmod => page.updated_at
  end
end
