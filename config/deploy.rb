set :application, "opendata"
set :repository,  "."

set :deploy_via, :copy

set :user, 'stephen'
set :runner, user
set :use_sudo, false

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# The address of the remote host on EC2 (the Public DNS address)
set :location, "tellybox.local"
# setup some Capistrano roles
role :app, location
role :web, location
role :db,  location, :primary => true

set :deploy_to, "/home/stephen/ruby/#{application}"

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_dsa")]

set :rails_env, "test"


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end