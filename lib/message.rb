require 'data_mapper'
class Message
  include DataMapper::Resource

  property :id,  Serial
  property :content, Text
  property :created_at, DateTime

  def abbreviate
    content[0..19]
  end

end
