require './app'
require './bot'
require 'facebook/messenger'

# run both Sinatra and facebook-messenger on /webhook
map("/webhook") do
  run Facebook::Messenger::Server
end

map("/api") do
  run Sinatra::Application
end
