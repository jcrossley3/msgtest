ENV['RACK_ENV'] ||= 'development'
require 'bundler/setup'

require 'slim'
require 'rhino'
require 'coffee-script'

require_relative 'lib/message_broker'

require 'sinatra'

get '/' do
  slim :index
end

post '/message' do
  broker = MessageBroker.new
  broker.send_to_all(params[:body])

  status 201
end

get '/stream', provides: 'text/event-stream' do
  headers['Transfer-Encoding'] = 'chunked'

  broker = MessageBroker.new
  stream do |out|
    out << "event: hello\ndata: hello\n\n"

    broker.receive do |message|
      out << "event: message\ndata: #{message}\n\n"
    end
  end
end

get '/message.js' do
  coffee :message
end
