require 'sinatra'
require 'dotenv'
Dotenv.load

get '/domanda/:text' do
  AnalisiInput.domande(params[:text])
end

get '/tutorial/:text' do
  AnalisiInput.tutorial(params[:text])
end

get '/tutor/:text' do
  AnalisiInput.tutor(params[:text])
end

get "/" do
  "Nothing to see here"
end
