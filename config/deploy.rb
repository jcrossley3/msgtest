require 'torquebox-capistrano-support'
require 'bundler/capistrano'

set :application, "msgtest"
set :repository,  "git://github.com/alindeman/msgtest.git"

set :torquebox_home, "/opt/torquebox"
set :app_ruby_version, "1.9"

set :rails_env, "production"
set :app_environment, { "RACK_ENV" => "production" }

set :user, "torquebox"
ssh_options[:keys] = [File.join(ENV['HOME'], ".ssh", "andylindeman.pem")]

role :web, "ec2-23-20-51-41.compute-1.amazonaws.com"
role :app, "ec2-23-20-51-41.compute-1.amazonaws.com"
role :db,  "ec2-23-20-51-41.compute-1.amazonaws.com", :primary => true
