# frozen_string_literal: true

ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './lib/message'
require './config/data_mapper.rb'
require 'pry'

# Runs Bounce Messaging App
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

  # rubocop:disable Style/SpecialGlobalVars
  run! if app_file == $0
  # rubocop:enable Style/SpecialGlobalVars
end
