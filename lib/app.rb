require 'sinatra/base'

class Bounce < Sinatra::Base
  enable :sessions

  before do
    session[:history] == nil ? session[:history] = [] : session[:history]
  end

  get '/' do
    @message_history = session[:history]
    @message_history << session[:message]
    erb(:index)
  end

  post '/send_message' do
    session[:message] = params[:message]
    redirect '/'
  end

  run! if app_file == $0

end
