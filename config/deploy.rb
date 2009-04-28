# This defines a deployment "recipe" that you can feed to switchtower
# (http://manuals.rubyonrails.com/read/book/17). It allows you to automate
# (among other things) the deployment of your application.

# =============================================================================
# REQUIRED VARIABLES
# =============================================================================

set :application, "4ever"

set :repository, "git@github.com:jonmagic/foreverrememberme.git"
set :scm_user, 'jonmagic'
set :scm_passphrase, "316w4ldr0n"
set :scm, :git
set :deploy_via, :remote_cache
set :branch, "master"

# =============================================================================
# ROLES
# =============================================================================

set :user, "forever"
set :domain, "www.foreverrememberme.com"
server domain, :app, :web
role :db, domain, :primary => true

# =============================================================================
# OPTIONAL VARIABLES
# =============================================================================
set :user_path, "/home/forever"
set :deploy_to, "#{user_path}/apps"
set :release_path, "#{deploy_to}/current"

# =============================================================================
# TASKS
# =============================================================================

after "deploy:update", "forever:update_configs"

namespace :forever do
  desc "This task sets up all my particular symlinks"
  task :update_configs do
    run "cp #{user_path}/pro_config/production_v1/config/database.yml #{release_path}/config/"
    run "ln -s #{user_path}/files/picture #{release_path}/public/picture"
    run "ln -s #{user_path}/files/music #{release_path}/public/music"
    run "chmod 755 #{release_path}/public"
    run "chmod 755 #{release_path}/public/*"
  end
end