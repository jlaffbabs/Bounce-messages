require 'sinatra/base'
require './lib/message'

class Bounce < Sinatra::Base
  enable :sessions



  # get '/' do
  #   session[:messages] ||= []
  #   @messages = session[:messages]
  #   erb(:index)
  # end

  # post '/message' do
  #   message = Message.new(params[:content])
  #   session[:messages] << message

  #   redirect '/'
  # end




  before do
    session[:history] == nil ? session[:history] = [] : session[:history]
  end

  get '/' do
    @message_history = session[:history]
    erb(:index)
  end

  post '/send_message' do
    message = Message.new(params[:message])
    session[:history] << message
    redirect '/'
  end

  run! if app_file == $0

end
