require 'bundler/setup'
Bundler.require(:default, ENV['RACK_ENV'])
require 'sinatra'

get '/' do
  slim :index
end
