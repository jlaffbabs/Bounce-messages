require 'data_mapper'
DataMapper.setup(:default, 'postgres://localhost/bounce_messages')

DataMapper.finalize
DataMapper.auto_migrate!
