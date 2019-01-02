# frozen_string_literal: true

def send_message
  visit '/'
  fill_in :content, with: 'Hello, world'
  click_button 'Send'
end
