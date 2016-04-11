# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

every :sunday, :at => '12pm' do
  rake 'sitemap:refresh'
end

every :day, at: '7am' do
  rake 'send_buffer_updates'
end
