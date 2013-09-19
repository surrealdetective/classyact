require 'bundler/capistrano'

set :application, "classyact002"
set :repository,  "git@github.com:surrealdetective/classyact.git"

set :user, 'deploy'
set :deploy_to, "/home/#{ user }/#{ application }"
set :use_sudo, false

set :scm, :git

default_run_options[:pty] = true

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "192.241.143.57"                          # Your HTTP server, Apache/etc
role :app, "192.241.143.57"                          # This may be the same as your `Web` server

# If you want a shared database across deploys, uncomment this:
before 'deploy:assets:precompile', 'deploy:symlink_config'

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
 # If you want to create a sym_link to your shared database, uncomment this:
  task :symlink_config, :roles => :app do 
   run "ln -nfs #{shared_path}/production.sqlite3 #{current_release}/db/production.sqlite3"
  end
end