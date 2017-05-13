require 'sinatra'
require 'dotenv'
Dotenv.load

get '/domanda/:text' do
  headers['Access-Control-Allow-Origin'] = "*"
  headers['Access-Control-Allow-Headers'] ="accept, authorization, origin"
  AnalisiInput.domande(params[:text])
end

get '/tutorial/:text' do
  headers['Access-Control-Allow-Origin'] = "*"
  headers['Access-Control-Allow-Headers'] ="accept, authorization, origin"
  AnalisiInput.tutorial(params[:text])
end

get '/tutor/:text' do
  headers['Access-Control-Allow-Origin'] = "*"
  headers['Access-Control-Allow-Headers'] ="accept, authorization, origin"
  AnalisiInput.tutor(params[:text])
end

get "/" do
  "Nothing to see here"
end
