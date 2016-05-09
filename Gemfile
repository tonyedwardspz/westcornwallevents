source 'https://rubygems.org'
ruby '2.2.3'

gem 'dotenv-rails'
gem 'rails', '~> 4.2.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'bcrypt', '~> 3.1.7'
# gem "service-worker-cache-rails", '~>0.2.0'
gem 'service-worker-cache-rails', '~>0.2.0', :path => '../../service-worker-cache-rails'
gem 'autoprefixer-rails'

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'quiet_assets'
end

group :test do
  gem 'minitest-spec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'minitest-reporters'
  gem 'mocha'
  gem 'launchy'
  gem 'capybara_minitest_spec'
  gem 'guard', require: false
  gem 'guard-minitest', require: false
  gem 'simplecov', require: false
  gem 'shoulda', '~> 3.5'
  gem 'rails-controller-testing'
end

group :production do
  gem 'rollbar', '~> 2.8.3', group: :production
  gem 'skylight', group: :production
  gem 'sitemap_generator', group: :production
end

gem 'bullet'
gem 'buffer', :github => 'bufferapp/buffer-ruby'
gem 'omniauth-buffer2'
gem 'pg_search'
gem 'seed_dump'
gem 'friendly_id', '~> 5.1.0'
gem 'slim-rails'
gem 'unicorn'
gem 'lazyload-rails'
gem 'carrierwave', '~> 0.9'
gem 'simple_form', '~> 3.1.0'
gem "mini_magick"
gem 'whenever', :require => false
gem 'minitest-rails'
gem 'capistrano', '~> 3.4.0', require: false
gem 'capistrano-maintenance', require: false
gem 'capistrano-rbenv', require: false
gem 'capistrano-bundler', require: false
gem 'capistrano-rails', require: false
gem 'capistrano-pending', require: false
gem 'gibbon', github: "amro/gibbon"
gem 'rack-cors', :require => 'rack/cors'
gem "recaptcha", :require => "recaptcha/rails", :git => 'https://github.com/ambethia/recaptcha.git'

source 'http://rails-assets.org' do
  gem 'rails-assets-RRSSB'
end
