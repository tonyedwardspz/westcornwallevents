Rails.application.config.middleware.use OmniAuth::Builder do
  provider :buffer, ENV['BUFFER_KEY'], ENV['BUFFER_SECRET']
end
