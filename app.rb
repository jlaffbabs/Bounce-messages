ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/message'
require './config/data_mapper.rb'
require 'pry'

class Bounce < Sinatra::Base
  get '/' do
    @messages = Message.all
    erb(:index)
  end

  post '/send_message' do
    Message.create(content: params[:content])
    redirect '/'
  end

  get '/message/:id' do
    @message = Message.get(params[:id])
    erb(:message)
  end

  get '/edit_message/:id' do
    @message = Message.get(params[:id])
    erb(:edit)
  end

  post '/edited_message/:id' do
    message = Message.get(params[:id])
    message.update(:content => params[:edit])
    redirect '/'
  end

  post '/delete_message/:id' do
    message = Message.get(params[:id])
    message.destroy
    redirect '/'
  end

  run! if app_file == $0
end
