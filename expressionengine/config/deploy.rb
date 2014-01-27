# =========================================================================== #
# deploy.rb for ExpressionEngine projects.
# =========================================================================== #

# =========================================================================== #
# Configuration common to all stages.
# =========================================================================== #
set :application, '{{APPLICATION_NAME}}'

# =========================================================================== #
# Repository information.
# =========================================================================== #

# Use git for source control. 
set :scm, :git
# URL to publicly available git repo.
set :repo_url, '{{REPOSITORY_URL}}'
# Use the current local branch as default to deploy. 
ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
# 
set :keep_releases, 5

# =========================================================================== #
# Logging configuration.
# =========================================================================== #
set :format, :pretty
#set :log_level, :debug

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  # :restart is empty; there is no application to restart.
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here.
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'

end
