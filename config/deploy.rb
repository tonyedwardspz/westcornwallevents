# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'west_cornwall_events'
set :repo_url, 'git@github.com:tonyedwardspz/westcornwallevents.git'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/rails/apps/#{fetch :application}"

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', '.env')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads', 'public/eventimages')

# Setup Rbenv
set :rbenv_path, "$HOME/.rbenv"
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, File.read('.ruby-version').strip

set :rollbar_token, ENV['ROLLBAR_ACCESS']
set :rollbar_env, Proc.new { fetch :stage }
set :rollbar_role, Proc.new { :app }

set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  task :restart do
    on roles(:web) do
      execute :sudo, 'service', 'unicorn', 'restart'
    end
  end

  task :env do
    on roles(:web) do
      upload!('.env', "#{shared_path}/.env")
    end
  end
end

before 'deploy:restart', 'deploy:env'
after 'deploy', 'deploy:restart'
after 'deploy', 'deploy:sitemap:refresh'
