# frozen_string_literal: true

require 'data_mapper'

# Messaging Methods
class Message
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  def abbreviate
    content[0..19]
  end
end
