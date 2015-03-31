require 'dotenv'
Dotenv.load

require 'mina/bundler'
require 'mina/git'
require 'mina/rbenv'

set :domain,    ENV['DOMAIN']
set :user,      ENV['SSH_USER']
set :deploy_to, ENV['DEPLOY_TO']

set :repository, 'git://github.com/7even/keeper.git'
set :branch, ENV['BRANCH'] || 'master'

# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, %w(log tmp)

task :environment do
  invoke :'rbenv:load'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/#{shared_path}/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log"]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'deploy:cleanup'
    
    to :launch do
      queue! %[bundle exec pumactl -F config/puma.rb restart]
    end
  end
end
