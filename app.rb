ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './lib/message'
require './config/data_mapper.rb'
require 'pry'

class Bounce < Sinatra::Base

  # before do
  #   session[:history] == nil ? session[:history] = [] : session[:history]
  # end

  get '/' do
    @messages = Message.all
    erb(:index)
  end

  post '/send_message' do
    Message.create(content: params[:content])
    redirect '/'
  end

  run! if app_file == $0

end
