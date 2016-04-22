ServiceWorkerCacheRails.configure do |config|
  # Name your cache
  config.cache_name = 'west-cornwall-events-v1'

  # Array of files to be cached
  config.assets = ['application.css', 'application.js', 'logo.png']

  # Show debug messages?
  config.debug = false
end
