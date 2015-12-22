require 'rollbar'

Rollbar.configure do |config|
  config.access_token = ENV['ROLLBAR_ACCESSs']
end

Rollbar.error('Hello world')
