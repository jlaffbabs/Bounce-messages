# frozen_string_literal: true

require 'data_mapper'

if ENV['RACK_ENV'] == 'development'
  DataMapper.setup(:default, 'postgres://localhost/bounce_messages')
  DataMapper.finalize
  DataMapper.auto_upgrade!
else
  DataMapper.setup(:default, 'postgres://localhost/bounce_messages_test')
  DataMapper.finalize
  DataMapper.auto_migrate!
end
